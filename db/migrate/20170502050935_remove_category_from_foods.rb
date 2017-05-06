class RemoveCategoryFromFoods < ActiveRecord::Migration[5.0]
  def change
    remove_column :foods, :category, :string
  end
end
