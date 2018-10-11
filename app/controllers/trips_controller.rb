class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = Trip.where(user_id: @user).sort_by{|trip| trip.date_begin.year}.reverse
  end

  def show
    @trip = Trip.find(params[:id])
    @steps = Step.where(trip_id: params[:id])
    @restaurants = @trip.restaurants
    @bars = @trip.bars
    @hotels = @trip.hotels
    @activities = @trip.activities

    @steps_geoloc = Step.where(trip_id: params[:id])

    @markers = @steps_geoloc.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def new
   @trip = Trip.new
  end

  def create
    @user = current_user
    @trip = Trip.new(trip_params)
    @trip.user_id = @user.id

    if @trip.save
      redirect_to trip_path(@trip)
     # flash[:notice] = "Votre nouveau voyage a été créé avec succès !"
    else
      #flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
    # flash[:notice] = "Votre playground a bien été supprimé!"
  end



  private

  def trip_params
    params.require(:trip).permit(:title, :date_begin, :date_end, :photo)
  end

end
