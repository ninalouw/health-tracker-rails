class Api::V1::FoodsController < ApplicationController

  def create
  new_food_params = params.require(:food).permit(:title, :calories,
                                                  :macro_group, :date,
                                                  :category_id)
  food = Food.new new_food_params
  food.user = @api_user
  if food.save
    render json: { id: food.id, status: :success }
  else
    render json: { status: :failure, errors: food.errors.full_messages }
  end
end

  def index
    @foods = current_user.foods
    # @foods = User.first.foods.order(created_at: :desc)
    render json: @foods
  end

  def show
    food = Food.find params[:id]
    render json: food
  end

end
