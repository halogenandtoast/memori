class StudyController < ApplicationController
  before_filter :authorize
  def show
    @deck = Deck.find(params[:id])
    if @record = current_user.current_record_for_deck(@deck)
      @card = @record.card
    else
      @card = @deck.cards.order("RANDOM()").first
      @record = current_user.record_for_card(@card)
      @record.activate!
      @record.seen!
    end
  end
end
