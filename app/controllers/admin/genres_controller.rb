class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page]).per(10)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを登録しました"
      redirect_to request.referer
    else
      @genres = Genre.page(params[:page]).per(10)
      flash[:notice] = "ジャンル名を入力してください"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンル名の変更が完了しました"
      redirect_to admin_genres_path
    else
      flash[:notice] = "ジャンル名を入力してください"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
