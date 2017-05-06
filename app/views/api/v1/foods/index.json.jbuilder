json.array! @foods do |food|
  json.id food.id
  json.title food.title
  json.calories food.calories
  json.macro_group food.macro_group
  json.date food.date
  json.user do
    json.first_name food.user_first_name
    json.last_name  food.user_last_name
  end
  json.url api_v1_food_url(food)
end
