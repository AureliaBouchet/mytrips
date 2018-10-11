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
      @trip.number_steps += 1

      @trip.save
      redirect_to trip_path(@trip)
      # flash[:notice] = "La création de votre nouveau playground a été effectuée"
    else
      # flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end
  # def show
  #   @step = Step.find(params[:id])
  #   @restaurants = Restaurant.where(step_id: @step.id )

  #   @bars = Bar.All
  #   @hotels = Hotel.All
  #   @activities = Activity.All
  # end
  def index
    @trip = Trip.find(params[:trip_id])
    @steps = Step.where(trip_id: @trip.id)
    # @restaurants = Restaurant.All
    # @bars = Bar.All
    # @hotels = Hotel.All
    # @activities = Activity.All
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
    params.require(:step).permit(:place, :comment, :date_begin, :date_end, :love_tag)
  end
end
