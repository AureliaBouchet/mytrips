class UsersController < ApplicationController

  def show
    @user = current_user
    @trips = Trip.where(user_id: @user).sort_by{|trip| trip.date_begin.year}.reverse
  end
  def edit

  end
  def update

  end

end
