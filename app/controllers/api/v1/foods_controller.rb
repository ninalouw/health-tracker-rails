class Api::V1::FoodsController < ApplicationController
  def create
    new_food_params = params.require(:food).permit(:title, :calories,
                                                    :macro_group, :date,
                                                    :category_id)
    food = Food.new new_food_params
    food.user = @api_user
    # food.user = User.find_by_id(6)
    if food.save
      render json: { id: food.id, status: :success }
    else
      render json: { status: :failure, errors: food.errors.full_messages }
    end
end

  def index
    # @foods = current_user.foods
    # no current_user, for now use User with id 6
    @foods = User.find_by_id(6).foods.order(created_at: :desc)
    # @foods = Food.order(created_at: :desc)
    render json: @foods
  end


  def show
    food = Food.find params[:id]
    render json: food
  end

end
