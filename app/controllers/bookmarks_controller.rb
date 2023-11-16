class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark = List.find(params: [:list_id])
      if @bookmark.save
        redirect_to lists_path(@list)
      else
        render "lists/show"
      end
  end

  def new
    @bookmark = Bookmark.new
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
