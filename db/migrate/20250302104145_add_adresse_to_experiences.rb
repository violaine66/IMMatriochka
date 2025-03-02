class AddAdresseToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :adresse, :string
  end
end
