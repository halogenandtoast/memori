class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end
end
