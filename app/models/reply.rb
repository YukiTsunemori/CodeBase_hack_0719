class Reply < ApplicationRecord
  belongs_to :post, dependent: :destroy
  belongs_to :user, dependent: :destroy
  scope :reply_ordered, -> { order(created_at: :asc) } # 返信文は作成日を昇順に並べます
  validates :text, presence: true, length: { maximum: 140 }

  # Additional methods or validations can be added here if neededc
end
