class DecksController < ApplicationController
  before_filter :authorize
  def index
    @decks = Deck.all
  end

  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
  end
end
