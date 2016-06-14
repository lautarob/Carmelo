class CarsTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :cars_travels, id: false do |t|
      t.belongs_to :car, index: true
      t.belongs_to :travel, index: true
    end
  end
end
