class SirTrevorImagesController < ApplicationController
  def upload
    image = SirTrevorImage.new(image: image_params[:file])

    if image.save!
      render json: image.as_json, status: 200
    else
      render json: image.errors, status: 500
    end
  end

  private

  def image_params
    params.require(:attachment)
  end
end
