class AdventuresController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @adventures = Adventure.all
  end

  def new
    @adventures = Adventure.all
    @adventure = Adventure.new()
  end

  def create
    @chapter = Chapter.all.first
    @adventures = Adventure.all
    @adventure = Adventure.new(user_id: current_user.id, title: adventure_params[:title])
    if @adventure.save
      flash[:notice] = "Welcome to your adventure #{@adventure.user.name}."
      redirect_to chapter_path(@chapter)
    else
      flash[:notice] = "Adventure cannot be blank."
      render 'new'
    end
  end

  def show
    @chapter = Chapter.all.first
    @adventure = Adventure.find(params[:id])
    @chapters = @adventure.chapters
  end

private

  def adventure_params
    params.require(:adventure).permit(:user_id, :title)
  end
end