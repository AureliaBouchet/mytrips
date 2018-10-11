class BarsController < ApplicationController

  def new
    @step = Step.find(params[:step_id])
    @bar = Bar.new
  end

  def create
    @step = Step.find(params[:step_id])
    trip = Trip.find(@step.trip_id)
    @bar = Bar.new(bar_params)
    @bar.step_id = @step.id
    if @bar.save
      redirect_to trip_path(trip)
     # flash[:notice] = "Votre nouveau voyage a été créé avec succès !"
    else
      #flash[:alert] = "Vous devez remplir les champs obligatoires"
      render :new
    end
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    step = Step.find(@bar.step_id)
    trip = Trip.find(step.trip_id)
    @bar.update(bar_params)
    redirect_to trip_path(trip)
  end

  def destroy
    @bar = Bar.find(params[:id])
    step = Step.find(@bar.step_id)
    trip = Trip.find(step.trip_id)
    @bar.destroy
    redirect_to trip_path(trip)
  end

  private
  def bar_params
    params.require(:bar).permit(:name, :price, :love_tag, :step_id)
  end


end
