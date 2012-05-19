class Card < ActiveRecord::Base
  attr_accessible :front, :back
  belongs_to :deck
end
