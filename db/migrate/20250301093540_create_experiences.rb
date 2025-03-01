class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :nom
      t.string :description
      t.integer :prix

      t.timestamps
    end
  end
end
