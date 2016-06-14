class UsersCars < ActiveRecord::Migration[5.0]
  def change
    create_table :users_cars, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :car, index: true
    end
  end
end
