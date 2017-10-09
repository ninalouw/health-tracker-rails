class Api::V1::FoodsController < ActionController::Base

  def create
    food = Food.new(food_params)
    # food.user = @api_user
    food.user = User.last
    if food.save
      render json: { id: food.id, status: :success }
    else
      render json: { status: :failure, errors: food.errors.full_messages }
    end
  end

  def index
    @foods = Food.order(created_at: :desc)
    render json: @foods
  end


  def show
    food = Food.find params[:id]
    render json: food
  end

  def edit
    @category = Category.all
  end

  def update
    @food = Food.find params[:id]
    if @food.update food_params
      render json: @food
    else
      flash.now[:alert] = 'Please see errors below!'
    end
  end

  def destroy
    @food = Food.find params[:id]
    @food.destroy
  end

  private
  def food_params
    params.require(:food).permit(:title, :calories, 
                                :macro_group, 
                                :date,
                                :category_id)
  end
end
