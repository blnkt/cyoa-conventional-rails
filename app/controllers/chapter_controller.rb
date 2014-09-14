class ChaptersController < ApplicationController
  before_action :authenticate_user!, except: [ :show ]

  def new
    @chapter = Chapter.new()
  end

  def show
    @chapter = Chapter.find(params[:id])
    @adventure.add_chapter(@chapter)
    @choices = @chapter.choices
  end

  private
  def chapter_params
    params.require(:chapter).permit(:prompt, :episode, :parent_id)
  end
end