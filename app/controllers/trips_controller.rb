class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = Trip.where(user_id: @user).sort_by{|trip| trip.date_begin.year}.reverse
  end

  def show
    @trip = Trip.find(params[:id])
    @steps = Step.where(trip_id: params[:id])
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

  private

  def trip_params
    params.require(:trip).permit(:title, :date_begin, :date_end)
  end

end
