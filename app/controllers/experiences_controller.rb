class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.includes(:reviews).find(params[:id])
    if @experience.latitude && @experience.longitude
      @markers = [
        {
          lat: @experience.latitude,
          lng: @experience.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: { experience: @experience })
        }
      ]
    else
      @markers = []
    end
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.save
    redirect_to experience_path(@experience)
  end

  private
  def experience_params
    params.require(:experience).permit(:title, :description, :prix, :adresse, photo_url: [])
  end
end
