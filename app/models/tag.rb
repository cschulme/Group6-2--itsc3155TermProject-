class Tag < ApplicationRecord
    validates :tagName, presence: true
    validates :tagName, length: { maximum: 20 }
end
