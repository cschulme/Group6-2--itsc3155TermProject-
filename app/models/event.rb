class Event < ApplicationRecord
  belongs_to :tag
  validates :title, :eventDate, :startTime, :endTime, presence: true
  validate :validStartAndEndTime
  
  def validStartAndEndTime
    if :startTime > :endTime
        self.errors[:base] << "Your staring time must be before your ending time!"
    else
        return true
    end
  end
end
