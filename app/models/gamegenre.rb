class Gamegenre < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  validates :gamegenre, presence: true, uniqueness: true
end
