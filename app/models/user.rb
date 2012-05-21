class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :password
  has_many :card_records

  def current_record_for_deck(deck)
    card_records.where(card_id: deck.card_ids, active: true).first
  end

  def brown_count(deck)
    deck.cards.count - yellow_count(deck) - green_count(deck)
  end

  def yellow_count(deck)
    yellow_cards_for_deck(deck).count
  end

  def green_count(deck)
    green_cards_for_deck(deck).count
  end

  def brown_cards_for_deck(deck)
    card_records.where(card_id: deck.card_ids, bucket: 0)
  end

  def yellow_cards_for_deck(deck)
    card_records.where(card_id: deck.card_ids, bucket: 1)
  end

  def green_cards_for_deck(deck)
    card_records.where(card_id: deck.card_ids).where("card_records.bucket > 1")
  end

  def record_for_card(card)
    existing_record_for_card(card) || build_record_for_card(card)
  end

  def next_card_for_deck(deck)
    ids = lowest_card_ids_for_deck(deck)
    Card.find(ids.shuffle.first)
  end

  def lowest_card_ids_for_deck(deck, range = 100)
    scores = {}
    deck.card_ids.each { |id| scores[id] = 200 }
    card_records.where(card_id: deck.card_ids).each { |record| scores[record.card_id] = record.srs_score }
    logger.info scores.inspect
    sorted_scores = scores.sort_by{|key, value| value}
    lowest_score = sorted_scores[0][1]
    set = sorted_scores.select{|id, score| score < lowest_score + range}
    set.map{|id, score| id}
  end

  private

  def existing_record_for_card(card)
    card_records.where(card_id: card.id).first
  end

  def build_record_for_card(card)
    card_records.build.tap do |record|
      record.card_id = card.id
    end
  end


end
