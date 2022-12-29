class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  #validates_presence_of :id
  validates_presence_of :name
  #validates_presence_of :
  validates_presence_of :instructions
end
