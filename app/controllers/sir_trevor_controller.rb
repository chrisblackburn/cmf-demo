class SirTrevorController < ApplicationController
  def file_upload
    file = SirTrevorFile.new(file: file_params[:file])

    if file.save!
      render json: file.as_json, status: 200
    else
      render json: file.errors, status: 500
    end
  end

  private

  def file_params
    params.require(:attachment)
  end
end
