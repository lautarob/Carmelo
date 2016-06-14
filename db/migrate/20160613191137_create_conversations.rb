class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :subject
      t.references :sender
      t.references :recipient
      t.boolean :is_simple_conversation

      t.timestamps
    end
  end
end
