class RelationshipsController < ApplicationController
  def create
    @relationship = Relationship.new()
    @relationship.followed_id = User.find(params[:user_id]).id
    @relationship.follower_id = current_user.id
    @relationship.save
    redirect_to user_path(current_user)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end

  private

  # def relationship_params
  #   params.require(:relationship).permit(:followed_id, :follower_id)
  # end
end
