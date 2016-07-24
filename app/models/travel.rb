class Travel < ApplicationRecord
  belongs_to :car
  has_many :conversations
  has_and_belongs_to_many :users
end
