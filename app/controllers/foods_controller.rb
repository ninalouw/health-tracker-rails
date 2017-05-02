class FoodsController < ApplicationController
  before_action :find_food, only: [:edit, :update, :destroy, :show]

  def new
    @food = Food.new
  end

  def create
    @food = Food.new food_params
    # @food.user = current_user
    if @food.save
      flash[:notice] = 'Food Created'
      redirect_to food_path(@food)
    else
      flash.now[:alert] = 'Please see errors below'
      render :new
    end
  end

  def index
  @foods = Food.order(created_at: :desc)
  respond_to do |format|
    format.html { render }
    format.text { render }
    format.xml  { render xml: @food }
    format.json { render json: @food.to_json }
  end
end

def edit; end

def update
  if @food.update food_params
    flash[:notice] = 'Food updated'
    redirect_to food_path(@food)
  else
    flash.now[:alert] = 'Please see errors below!'
    render :edit
  end
end

def show
  respond_to do |format|
    format.html { render }
    format.text { render }
    format.xml  { render xml: @food }
    format.json { render json: @food.to_json }
  end
end

def destroy
  @food.destroy
  redirect_to foods_path, notice: 'Food Deleted'
end

  private

  def food_params
    params.require(:food).permit([:title, :category,
                                  :calories, :macro_group, :date])
  end

  def find_food
    @food = Food.find params[:id]
  end
end
