class ReviewsController < ApplicationController
  before_action :set_experience

  def new
    @review = @experience.reviews.build
  end

  def create
    @review = @experience.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to experience_path(@experience), notice: "Avis créée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def review_params
    params.require(:review).permit(:contenu, :note, :experience_id)
  end
end
