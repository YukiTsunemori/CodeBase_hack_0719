class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :user
  scope :reply_ordered, -> { order(created_at: :asc) } # 返信文は作成日を昇順に並べます
  validates :text, presence: true, length: { maximum: 140 }

  # Additional methods or validations can be added here if neededc
end
