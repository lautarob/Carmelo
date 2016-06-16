class UsersTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :users_travels, id: false do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :travel, index: true, null: false
    end
  end
end
