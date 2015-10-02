class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, except: [:index,:new,:edit,:create]
  def index

  end
  def new
    #@exercise= current_user.exercises.new
  end
  def edit
  end
  def create
    @exercise = current_user.exercises.new(exercise_params)
    if @exercise.save
      flash[:success]="Exercise has been created"
      redirect_to [current_user, @exercise]
    else
      flash[:danger]="Failed to save"
      render :new
    end
  end
  def show

  end
  private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min,:workout,:workout_date,:user_id)
  end
  def set_exercise
    @exercise=current_user.exercises.find(params[:id])
  end
end
