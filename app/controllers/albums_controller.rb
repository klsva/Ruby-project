class AlbumsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @albums = Album.paginate(page: params[:page])
  end

  def create
    @album = current_user.albums.build(album_params)
    if @album.save
      flash[:success] = "Альбом сохранен!"
      redirect_to root_url
    else
      @feed_items = []
      render 'main/index'
    end
  end

  def destroy
    @album.destroy
    flash[:success] = "Альбом удален"
    redirect_to request.referrer || root_url
    #request.referrer - переадресует на предыдущий url
  end

  #определяем строгие параметы, что можно редактировать
  private
    def album_params
      params.require(:album).permit(:album_name, :album_description)
    end

    def correct_user
      @album = current_user.albums.find_by(id: params[:id])
      redirect_to root_url if @album.nil?
    end

end
