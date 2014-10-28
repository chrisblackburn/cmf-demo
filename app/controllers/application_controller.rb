class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] if params.has_key?(:locale)
  end
end
