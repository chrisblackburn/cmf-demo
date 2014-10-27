class ContentController < ApplicationController
  def show
    @content = Content.find_by!("""
      slug = ?
      AND approved_at IS NOT NULL
      AND (
        (? >= live_from OR live_from IS NULL)
        AND
        (? <= live_to OR live_to IS NULL)
      )
      """, params[:slug], Time.now, Time.now)
  end
end
