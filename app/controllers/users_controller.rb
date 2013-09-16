class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
end


def feed
	Link.from_users_followed_by(self)
end


def index

  @users = User.all
  @user = current_user

end


def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end






end
