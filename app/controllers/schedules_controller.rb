class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.valid?
       @schedule.save
       redirect_to current_user
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def index
    @schedules = Schedule.all
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:status,
                                     :start_at,
                                     :end_at,
                                     :user_id)
  end
end
