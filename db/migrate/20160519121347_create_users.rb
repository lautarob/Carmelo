class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.string :username
      t.string :picture
      t.string :city
      t.string :province
      t.string :country
      t.string :password
      t.boolean :enabled

      t.timestamps
    end
  end
end
