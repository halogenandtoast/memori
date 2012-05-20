class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :password
  has_many :card_records

  def current_record_for_deck(deck)
    card_records.where(card_id: deck.card_ids, active: true).first
  end

  def record_for_card(card)
    existing_record_for_card(card) || build_record_for_card(card)
  end

  private

  def existing_record_for_card(card)
    record = card_records.where(card_id: card.id).first
    logger.info record
    record
  end

  def build_record_for_card(card)
    card_records.build.tap do |record|
      record.card_id = card.id
    end
  end


end
