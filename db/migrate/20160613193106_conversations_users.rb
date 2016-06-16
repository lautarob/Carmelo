class ConversationsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations_users, id: false do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :conversation, index: true, null: false
    end
  end
end
