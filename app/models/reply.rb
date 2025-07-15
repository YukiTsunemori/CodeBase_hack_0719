class Reply < ApplicationRecord
  belongs_to :post
  scope :ordered, -> { order(id: :desc) }
  validates :text, presence: true, length: { maximum: 140 }

  # Additional methods or validations can be added here if neededc
end
