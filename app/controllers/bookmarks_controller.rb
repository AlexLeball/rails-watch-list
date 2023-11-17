class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
      if @bookmark.save
        redirect_to lists_path(@list)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def new
    @bookmark = Bookmark.new
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
