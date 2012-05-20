class CardRecordsController < ApplicationController
  before_filter :authorize
  def update
    @record = current_user.card_records.find(params[:id])
    if params[:knew] == '1'
      @record.knew!
    else
      @record.did_not_know!
    end
    redirect_to [:study, @record.card.deck]
  end
end
