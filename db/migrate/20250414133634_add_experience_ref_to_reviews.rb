class AddExperienceRefToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :experience, null: true, foreign_key: true
  end
end
