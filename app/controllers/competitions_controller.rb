class CompetitionsController < ApplicationController
  def index
    @albums = Album.where("competition = 'true'")
  end

  def select_photos

    @photos = Album.find(params[:id]).photos.pluck(:file)
    respond_to do |format|
      format.json { render json: @photos }
    end
  end



end
