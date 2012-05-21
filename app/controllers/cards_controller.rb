class CardsController < ApplicationController
  before_filter :authorize

  def show
    @card = Card.find(params[:id])
    @record = current_user.record_for_card(@card)

    @color = case @record.bucket
             when 0 then "brown"
             when 1 then "yellow"
             else "green"
             end
  end
end
