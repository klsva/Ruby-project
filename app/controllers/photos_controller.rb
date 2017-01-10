class PhotosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  #before_action :correct_user, only: :destroy

  def new
    @photo = Photo.new
  end

  def create

  end

  def destroy

  end
end
