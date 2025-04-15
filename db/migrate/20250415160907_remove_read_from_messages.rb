class RemoveReadFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_column :messages, :read, :boolean
  end
end
