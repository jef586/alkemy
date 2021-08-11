# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :set_locale
  include ExceptionHandler

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
