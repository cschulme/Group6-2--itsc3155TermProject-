class Tag < ApplicationRecord
    has_many :events
    validates_associated :events
    validates :tagName, presence: true, length: { maximum: 30 }
end
