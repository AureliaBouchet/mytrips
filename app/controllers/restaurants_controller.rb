class RestaurantsController < ApplicationController

  def new
    @step = Step.find(params[:step_id])
    @restaurant = Restaurant.new
  end

  def create
    @step = Step.find(params[:step_id])
    trip = Trip.find(@step.trip_id)
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.step_id = @step.id
    if @restaurant.save
      redirect_to trip_path(trip)
     # flash[:notice] = "Votre nouveau voyage a été créé avec succès !"
    else
      #flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    step = Step.find(@restaurant.step_id)
    trip = Trip.find(step.trip_id)
    @restaurant.update(restaurant_params)
    redirect_to trip_path(trip)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    step = Step.find(@restaurant.step_id)
    trip = Trip.find(step.trip_id)
    @restaurant.destroy
    redirect_to trip_path(trip)
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :price, :love_tag, :step_id, :address, :latitude, :longitude)
  end
end
