class ActivitiesController < ApplicationController

  def new
    @step = Step.find(params[:step_id])
    @activity = Activity.new
  end

  def create
    @step = Step.find(params[:step_id])
    trip = Trip.find(@step.trip_id)
    @activity = Activity.new(activity_params)
    @activity.step_id = @step.id
    if @activity.save
      redirect_to trip_path(trip)
     # flash[:notice] = "Votre nouveau voyage a été créé avec succès !"
    else
      #flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    step = Step.find(@activity.step_id)
    trip = Trip.find(step.trip_id)
    @activity.update(activity_params)
    redirect_to trip_path(trip)
  end

  def destroy
    @activity = Activity.find(params[:id])
    step = Step.find(@activity.step_id)
    trip = Trip.find(step.trip_id)
    @activity.destroy
    redirect_to trip_path(trip)
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :price, :love_tag, :step_id)
  end


end
