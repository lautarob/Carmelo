class UsersRoles < ActiveRecord::Migration[5.0]
  def change
	 create_table :users_roles, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :role, index: true
    end
  end
end
