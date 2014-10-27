class ContentController < ApplicationController
  def show
    @content = Content.find_by!(slug: params[:slug])
  end
end
