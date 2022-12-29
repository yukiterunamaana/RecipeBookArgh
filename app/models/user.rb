class User < ApplicationRecord
  has_many :recipes
  #validates_presence_of :id
  validates_presence_of :nickname
  validates_presence_of :email
  validates_presence_of :password
end
