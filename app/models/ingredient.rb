class Ingredient < ApplicationRecord
  belongs_to :recipe
  # validates_presence_of :id
  validates_presence_of :name
end
