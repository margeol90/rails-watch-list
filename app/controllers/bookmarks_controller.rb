class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:content, :list_id, :movie_id)
  end
end
