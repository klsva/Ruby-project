class WorkController < ApplicationController
  def index
    @themes = Theme.all
  end

  def choose_theme
    @images = Theme.find(params[:id]).images.pluck(:file)
    respond_to do |format|
     format.json { render json: @images }
    end
  end

  def display_theme
  end

  def results_list
  end
end
