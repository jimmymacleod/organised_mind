class Note < ApplicationRecord


  belongs_to :day, optional: true 

  validates :title, :detail, :presence => true
  validates :title, :length => { :minimum => 4 }
  validates :title, :uniqueness => true
end
