class Target < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :deadline
    validates :plan, length: { maximum: 1000 }
    validates :image
    validates :future, length: { maximum: 200 }
  end
  validates :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 }
end
