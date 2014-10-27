class ContentController < ApplicationController
  def show
    @content = Content.find_by!('slug = ? AND approved_at IS NOT NULL', params[:slug])
  end
end
