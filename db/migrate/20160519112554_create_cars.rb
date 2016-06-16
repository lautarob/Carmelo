class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :model
      t.integer :slots
      t.string :register
      t.string :picture
      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
