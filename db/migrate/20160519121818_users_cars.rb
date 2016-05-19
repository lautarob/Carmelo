class UsersCars < ActiveRecord::Migration[5.0]
  def change
    create_table :users_cars, id: false do |t|
      t.references :user
      t.references :car
    end
  end
end
