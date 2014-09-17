class ChaptersController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]

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
      render 'show'
    end
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    @adventure.add_chapter(@chapter)
    @choices = @chapter.choices
    @parent = Chapter.find(@chapter.parent_id) unless @chapter.parent_id.nil?
  end

  private

  def chapter_params
    params.require(:chapter).permit(:prompt, :episode, :parent_id)
  end

end