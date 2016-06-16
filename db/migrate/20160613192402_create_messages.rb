class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.belongs_to :conversation, index: true, null: false
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
