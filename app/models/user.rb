class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :days
  has_many :notes
  has_many :tasks
end
