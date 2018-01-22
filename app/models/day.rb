class Day < ApplicationRecord

  has_many :tasks
  has_many :notes

  validates :date, :journal, :presence => true
  validates :journal, :length => { :minimum => 4 }
  validates :date, :uniqueness => true
end
