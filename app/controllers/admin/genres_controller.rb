class Admin::GenresController < ApplicationController

  #before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "追加しました"
      redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンルを追加してください"
      redirect_to
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:notice_update] = "ジャンル情報を更新しました"
    else
      render 'edit'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :created_at, :updated_at, :image)
  end

end