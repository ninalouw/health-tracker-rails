class AddCategoryToFoods < ActiveRecord::Migration[5.0]
  def change
    add_reference :foods, :category, foreign_key: true
  end
end
