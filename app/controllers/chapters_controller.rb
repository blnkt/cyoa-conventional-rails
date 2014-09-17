class ChaptersController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]

  def new
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.new()
  end

  def show
    @adventure = Adventure.find(params[:adventure_id])
    @chapter = Chapter.find(params[:id])
    @adventure.add_chapter(@chapter)
    @choices = @chapter.choices
  end

  private
  def chapter_params
    params.require(:chapter).permit(:prompt, :episode, :parent_id)
  end
end