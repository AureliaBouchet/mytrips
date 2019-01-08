class StepsController < ApplicationController

  def new
    @step = Step.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @step = Step.new(step_params)
    @step.trip = @trip
    if @step.save
      @trip.number_steps += 1

      @trip.save
      redirect_to trip_path(@trip)
      flash[:notice] = "La création de votre voyage a été effectuée avec succès"
    else
      # flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

   def update
    @step = Step.find(params[:id])
    @step.update(step_params)
    trip_id = @step.trip_id
    @trip = Trip.find(trip_id)
    redirect_to trip_path(@trip)
  end

  def destroy
    @step = Step.find(params[:id])
    trip_id = @step.trip_id
    @step.destroy
    redirect_to trip_path(trip_id)
    # flash[:notice] = "Votre playground a bien été supprimé!"
  end

  private
  def step_params
    params.require(:step).permit(:place, :comment, :night, :love_tag, :address, :longitude, :latitude, :photo, :photo_cache)
  end
end
