class User < ActiveRecord::Base
  has_and_belongs_to_many :conversations
  has_and_belongs_to_many :cars
  has_and_belongs_to_many :roles
  has_many :conversations, :foreign_key => :sender_id
  has_many :conversations, :foreign_key => :recipient_id
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
