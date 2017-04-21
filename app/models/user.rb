class User < ApplicationRecord
  has_secure_password
  validates :name, :alias, :email, presence: true
  validates :password, length: { in: 8..20 }
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea
end
