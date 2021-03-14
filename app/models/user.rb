class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :targets

  validates :name,   presence: true
  validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'Include both letters and numbers'}
end
