class FoodSerializer < ActiveModel::Serializer
  attributes :id, :title, :calories, :macro_group, :date, :user, :category_id

    belongs_to :category
    belongs_to :user
end
