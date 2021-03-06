class CompletedDaysController < ApplicationController
  
  # def index
  #   @completed_days = CompletedDay.all.sort_by(&:date)
  # end

  def new
    # @completed_days = CompletedDay.all.sort_by(&:date)
    @completed_day = CompletedDay.new
  end

  def create
    # @completed_days = CompletedDay.all.sort_by(&:date)
    @completed_day = CompletedDay.new(completed_day_params)
    if @completed_day.save
      redirect_to user_habits_path
    else
      render 'new'
    end
  end

  def destroy
    # byebug
    @completed_day = CompletedDay.find(params[:id])

    @completed_day.destroy
    redirect_to root_path
    # redirect_to edit_user_habit_path(current_user,@completed_day.habit)
  end

  private
    def completed_day_params
      params.require(:completed_day).permit(:date)
    end

        # Habit object from params
    def habit
      @habit = Habit.find(params[:id])
    end

    # Habit's completed days sorted
    def completed_days
      @completed_days = habit.completed_days_sorted
    end

end
