class ExercisesController < ApplicationController
  before_action :load_exercise, except: %i[new create index]

  def index
    @exercises = Exercise.all
    render layout: 'empty'
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      flash[:notice] = "Exercise added"
      redirect_to exercises_path
    else
      flash[:notice] = "Exercise could not be added"
      render :new
    end
  end

  def edit;  end

  def update
    if @exercise.update(exercise_params)
      flash[:notice] = "Exercise Updated"
      redirect_to exercises_path
    else
      flash[:notice] = "Exercise updation failed"
      render :update
    end
  end

  def show;  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :price, :description)
  end

  def id_param
    params.permit(:id)
  end

  def load_exercise
    @exercise = Exercise.find_by_id(id_param[:id])
    render 'error' and return if @exercise.nil?
  end
end
