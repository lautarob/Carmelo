class UsersRoles < ActiveRecord::Migration[5.0]
  def change
	 create_table :users_roles, id: false do |t|
      t.references :user
      t.references :role
    end
  end
end
