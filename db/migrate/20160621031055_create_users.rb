class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :facebook_image_url
      t.text :location
      t.text :facebook_url
      t.text :gender
      t.date :birth_date

      t.timestamps
    end
  end
end
