class ChaptersController < ApplicationController
  def index
    chapters = Chapter.all
    @serialized_chapters = ChapterSerializer.index(chapters)
  end

  def show
    chapter = Chapter.find(params[:id])
    @serialized_chapter = ChapterSerializer.show(chapter)
  end
end
