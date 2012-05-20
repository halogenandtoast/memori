class CardRecord < ActiveRecord::Base
  RATIO_WEIGHT = 100
  BUCKET_WEIGHT = 200
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
    self.last_seen_at = Time.now
    self.score = calculate_score
    self.save
  end

  def did_not_know!
    self.wrong_count += 1
    self.active = false
    self.bucket = 0
    self.last_seen_at = Time.now
    self.score = calculate_score
    self.save
  end

  def time_score
    diff = (Time.now - last_seen_at).to_i
    if diff < 5
      1000
    elsif diff < 10
      500
    elsif diff < 15
      200
    elsif diff < 20
      100
    elsif diff < 30
      50
    elsif diff < 60
      20
    elsif diff < 300
      15
    elsif diff < 3600
      10
    elsif diff < 7200
      5
    elsif diff < 36000
      1
    else
      0
    end
  end

  def srs_score
    score + time_score
  end

  private
  def calculate_score
    (ratio * RATIO_WEIGHT) + (bucket * BUCKET_WEIGHT)
  end

  def ratio
    (right_count + 1) / (wrong_count + 1)
  end
end
