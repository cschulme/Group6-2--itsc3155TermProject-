class Event < ApplicationRecord
    validates :title, :eventDate, :startTime, :endTime, presence: true
    validate :checkStartAndEndTime
    
    def checkStartAndEndTime
        if self.startTime.present? && self.endTime.present? && self.startTime < self.endTime 
            return true
        else
            self.errors[:base] << 'Starting time should be before the ending time!'
        end
    end
end
