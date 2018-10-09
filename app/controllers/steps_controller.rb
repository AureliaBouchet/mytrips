class StepsController < ApplicationController

  def new
    @step = Step.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    # @user = current_user
    @trip = Trip.find(params[:trip_id])
    @step = Step.new(step_params)
    @step.trip = @trip
    # @playground.user = @user
    if @step.save
      redirect_to trip_path(@trip)
      # flash[:notice] = "La création de votre nouveau playground a été effectuée"
    else
      # flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end

  private
  def step_params
    params.require(:step).permit(:place, :comment, :date_begin, :date_end, :hotel_price, :hotel, :love_tag)
  end
end
