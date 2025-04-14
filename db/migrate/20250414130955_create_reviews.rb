class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :contenu
      t.integer :note
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
