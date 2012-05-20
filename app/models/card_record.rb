class CardRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :card

  def activate!
    self.active = true
    self.save
  end

  def seen!
    self.seen_count += 1
    self.last_seen_at = Time.now
    self.save
  end

  def knew!
    self.right_count += 1
    self.active = false
    self.bucket += 1
    self.save
  end

  def did_not_know!
    self.wrong_count += 1
    self.active = false
    self.bucket = 0
    self.save
  end
end
