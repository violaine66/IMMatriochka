class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    # db/migrate/xxxxxx_add_admin_to_users.rb
    add_column :users, :admin, :boolean, default: false
  end
end
