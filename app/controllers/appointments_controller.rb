class AppointmentsController < ApplicationController
  before_action :set_appt, only: [:show, :edit, :update]

  def new
    @appt = Appointment.new
  end

  def create
    @appt = Appointment.new(appt_params)
    if @appt.valid?
       @appt.save!
       flash[:success] = "Your appointment has been created!"
       redirect_to appointment_path(@appt)
    else
       redirect_to new_appointment_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @appt.update(appt_params)
    redirect_to user_path(@current_user)
  end

  def index
    @appt = Appointment.all
  end

  def destroy
    @appt = Appointment.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  private
  def set_appt
    @appt = Appointment.find(params[:id])
  end

  def appt_params
    params.require(:appointment).permit(:note,
                                        :user_id,
                                        :shop_id,
                                        :service_id,
                                        :schedule_id,
                                        :start_at)
  end
end
