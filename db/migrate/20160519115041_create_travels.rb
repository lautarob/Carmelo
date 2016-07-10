class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.date :departure
      t.decimal :latitude, :precision => 10, :scale => 6
      t.decimal :longitude, :precision => 10, :scale => 6
      t.integer :available_places
      t.string :description
      t.string :origin
      t.string :destination
      t.belongs_to :car, null: false
      t.timestamps
    end

    add_index :travels, :origin
    add_index :travels, :destination

  end
end
