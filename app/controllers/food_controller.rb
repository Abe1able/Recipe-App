class FoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @foods = Food.all.includes([:user])
  end

  def show; end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
      flash[:notice] = 'food saved successfully'
    else
      render :new
      flash[:notice] = 'food has not been saved'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end
end
