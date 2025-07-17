class Reply < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy
  scope :ordered, -> { order(id: :desc) }
  validates :text, presence: true, length: { maximum: 140 }

  # Additional methods or validations can be added here if neededc
end
