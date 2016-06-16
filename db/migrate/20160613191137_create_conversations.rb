class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :subject
      t.belongs_to :travel, index: true, null: false
      
      t.timestamps
    end
  end
end