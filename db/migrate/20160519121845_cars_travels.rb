class CarsTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :cars_travels, id: false do |t|
      t.references :car
      t.references :travel
    end
  end
end
