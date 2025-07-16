class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy
  scope :ordered, -> { order(id: :desc) }
  validates :text, presence: true, length: { maximum: 140 }
end
