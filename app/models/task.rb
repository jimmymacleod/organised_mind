class Task < ApplicationRecord

  belongs_to :user
  belongs_to :day, optional: true

  validates :name, :description, :importance, :presence => true
  validates :name, :length => { :minimum => 4 }
  validates :name, :uniqueness => true
end
