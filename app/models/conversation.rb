class Conversation < ApplicationRecord
  has_many :messages
  has_and_belongs_to_many :users
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  scope :between, -> (sender_id,recipient_id) do
    where("(conversations.sender_id = ? AND conversations.recipient_id =?) OR (conversations.sender_id = ? AND conversations.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
  end
end
