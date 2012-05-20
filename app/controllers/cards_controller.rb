class CardsController < ApplicationController
  before_filter :authorize

  def show
    @card = Card.find(params[:id])
    @record = current_user.record_for_card(@card)
  end
end
