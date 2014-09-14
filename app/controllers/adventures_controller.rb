class AdventuresController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @adventures = Adventure.all
  end

  def new
    @adventures = Adventure.all
    @adventure = Adventure.new()
  end


  def show
    @adventure = Adventure.find(params[:id])
    @chapters = @adventure.chapters
  end

private

  def adventure_params
    params.require(:adventure).permit(:user_id, :title)
  end
end