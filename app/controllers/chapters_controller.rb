class ChaptersController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]
  skip_before_action :verify_authenticity_token, only: [:update]

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.new()
  end

  def create
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(@adventure.chapters.last.id)
    prompt = chapter_params[:prompt]
    unless prompt == ""
      @chapter.add_choice(prompt)
      flash[:notice] = "new branch added to #{@adventure.user.name}'s adventure."
      redirect_to adventure_chapter_path(@adventure, @chapter)
    else
      flash[:notice] = "choice cannot be blank"
      render 'new'
    end
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    @adventure.add_chapter(@chapter)
    @choices = @chapter.choices
  end

  def update
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    unless params[:chapter]['episode'] == ""
      @chapter.update(episode: params[:chapter]['episode'])
      flash[:notice] = "episode commited"
      redirect_to adventure_chapter_path(@adventure, @chapter)
    else
      flash[:notice] = "episode cannot be blank"
      render 'show'
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(:prompt, :episode, :parent_id)
  end

end