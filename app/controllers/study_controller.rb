class StudyController < ApplicationController
  def show
    @deck = Deck.find(params[:id])
    @card = @deck.cards.order("RANDOM()").first
  end
end
