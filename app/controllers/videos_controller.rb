class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.created_at
    redirect_to video_path(@video)
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:video).permit(:title, :introduction, :video)  #Videoモデルに:videoカラムはありませんが、ここはhas_one_attaches :videoに対応します。
  end
end
