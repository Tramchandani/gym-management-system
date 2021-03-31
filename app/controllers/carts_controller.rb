class CartsController < ApplicationController
  before_action :user_cart
  before_action :selected_exercise

  def index
    @exercises = @cart.exercises
    render layout: 'empty'
  end

  def add_to_cart
    if @cart.exercises << @exercise
      flash[:notice] = "Added to cart"
    else
      flash[:notice] = "could not be added to cart"
    end
    redirect_to exercises_path
  end

  def destroy
    if @cart.exercises.destroy(@exercise)
      flash[:notice] = "Removed from cart"
    else
      flash[:notice] = "could not remove from cart"
    end
    redirect_to exercises_path
  end

  private

  def user_cart
    @cart = current_user.cart
  end

  def exercise_id_params
    params.permit(:id)
  end

  def selected_exercise
    @exercise = Exercise.find_by_id(exercise_id_params[:id])
  end
end
