class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
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
    params.require(:experience).permit(:title, :description, :prix, :adresse)
  end
end
