class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @adventures = @user.adventures
  end

end