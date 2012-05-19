class WelcomeController < ApplicationController
  before_filter :check_user
  def index
  end

  private

  def check_user
    if signed_in?
      redirect_to decks_path
    end
  end
end
