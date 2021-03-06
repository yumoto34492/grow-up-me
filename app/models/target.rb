class Target < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def self.search(search)
    if search != ""
      Target.where(' title LIKE(?)', "%#{search}%" )
    else
      Target.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :deadline
    validates :plan, length: { maximum: 1000 }
    validates :future, length: { maximum: 200 }
  end

  validate :deadline_ago
    def deadline_ago
      unless deadline == nil
        errors.add(:deadline, 'can`t specify a date in the past') if deadline < Date.today
      end
    end
 end
