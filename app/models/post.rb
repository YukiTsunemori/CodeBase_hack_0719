class Post < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy
  scope :ordered, -> { order(create_at: :desc) } # 投稿は作成日を降順に並べます。
  validates :text, presence: true, length: { maximum: 140 }
end
