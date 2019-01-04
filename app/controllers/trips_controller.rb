class TripsController < ApplicationController
  def index
    if params[:query].present?
        results = Trip.global_search(params[:query])
      @trips = results.find_all { |trip| current_user.following.include? User.find(trip.user_id) }.sort_by{|trip| trip.date_begin }.reverse
      @title = "Découvrez les voyages en lien avec : #{params[:query]}"
    else
      # @trips = Trip.all.where.not(user_id: current_user).limit(10)
        @title = ""
        # @trips = current_user.following.trips
        @trips = Trip.all.find_all { |trip| current_user.following.include? User.find(trip.user_id) }.sort_by{|trip| trip.date_begin }.reverse
        # @trips = Trip.all.where(user_id)
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @tips = Tip.where(trip_id: params[:id])
    @steps = Step.where(trip_id: params[:id]).sort_by{|step| step.date_begin}
    @step = Step.new
    @restaurants = @trip.restaurants
    @bars = @trip.bars
    @hotels = @trip.hotels
    @activities = @trip.activities

    @steps_geoloc = Step.where(trip_id: params[:id]).where.not(latitude: nil, longitude: nil).sort_by{|step| step.date_begin}

    @markers = @steps_geoloc.map do |step|

      {
        lat: step.latitude,
        lng: step.longitude,
         # infoWindow: { content: "#{step.address}"}
          infoWindow: { content: render_to_string(partial: "/steps/map_box", locals: { step: step }) }
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
      redirect_to new_trip_step_path(@trip)
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
    user = current_user
    redirect_to user_path(user)
    # flash[:notice] = "Votre playground a bien été supprimé!"
  end

  private

  def trip_params
    params.require(:trip).permit(:title, :date_begin, :date_end, :photo, :address, :latitude, :longitude)
  end

end
