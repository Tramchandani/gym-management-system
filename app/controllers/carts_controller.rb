class CartsController < ApplicationController
  before_action :current_user
  before_action :current_cart

  def index
    @exercises = @cart.exercises
    render layout: 'empty'
  end

  def add_to_cart
    exercise = Exercise.find_by_id(exercise_id_params[:id])
    if @cart.exercises << exercise
      flash[:notice] = "Added to cart"
    else
      flash[:notice] = "could not be added to cart"
    end
    redirect_to exercises_path
  end

  def destroy
    if @cart.exercises.destroy(Exercise.find_by_id(exercise_id_params[:id]))
      flash[:notice] = "Removed from cart"
    else
      flash[:notice] = "could not remove from cart"
    end
    redirect_to exercises_path
  end

  private

  def current_cart
    if @user.cart.nil?
      @cart = @user.create_cart
    else
      @cart = @user.cart
    end
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def exercise_id_params
    params.permit(:id)
  end
end
