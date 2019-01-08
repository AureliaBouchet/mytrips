class HotelsController < ApplicationController

  def new
    @step = Step.find(params[:step_id])
    @hotel = Hotel.new
  end

  def create
    @step = Step.find(params[:step_id])
    trip = Trip.find(@step.trip_id)
    @hotel = Hotel.new(hotel_params)
    @hotel.step_id = @step.id
    if @hotel.save
      redirect_to trip_path(trip)
     # flash[:notice] = "Votre nouveau voyage a été créé avec succès !"
    else
      #flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    step = Step.find(@hotel.step_id)
    trip = Trip.find(step.trip_id)
    @hotel.update(hotel_params)
    redirect_to trip_path(trip)
  end

  def destroy
    @hotel = Hotel.find(params[:id])
    step = Step.find(@hotel.step_id)
    trip = Trip.find(step.trip_id)
    @hotel.destroy
    redirect_to trip_path(trip)
  end

  private
  def hotel_params
    params.require(:hotel).permit(:name, :price, :rating, :love_tag, :step_id, :address, :latitude, :longitude)
  end


end
