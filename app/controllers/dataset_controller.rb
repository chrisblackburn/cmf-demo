class DatasetController < ApplicationController
  def show
    @dataset = Dataset.all

    respond_to do |format|
      format.html
      format.json
     end
  end
end
