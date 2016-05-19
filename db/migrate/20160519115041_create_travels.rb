class CreateTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :travels do |t|
      t.float :travel_time
      t.date :departure
      t.integer :slots_remaining
      t.string :description
      t.string :city_origin
      t.string :province_origin
      t.string :country_origin
      t.string :city_destination
      t.string :province_destination
      t.string :country_destination

      t.timestamps
    end
  end
end
