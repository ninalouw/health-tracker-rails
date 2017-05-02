class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :title
      t.string :category
      t.integer :calories
      t.string :macro_group
      t.datetime :date

      t.timestamps
    end
  end
end
