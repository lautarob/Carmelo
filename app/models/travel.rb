class Travel < ApplicationRecord
  belongs_to :car
  has_many :conversations
  has_many :users
end
