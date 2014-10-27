class DatasetController < ApplicationController
  def show
    @dataset = Dataset.all
  end
end
