class Deck < ActiveRecord::Base
  attr_accessible :name
  has_many :cards

  def size
    length = cards.count
    if length < 151
      "small"
    elsif length < 401
      "medium"
    elsif length < 1001
      "large"
    else
      "x-large"
    end
  end
end
