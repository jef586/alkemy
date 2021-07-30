# frozen_string_literal: true

module ExceptionHandler
  extend ActiveSupport::Concern

  class TokenInvalid < StandardError; end
  class TokenExpired < StandardError; end
  included do
    rescue_from ExceptionHandler::TokenInvalid do |_error|
      render json: { message: "¡Access denied!. Invalid token." }, status: :unauthorized
    end
    rescue_from ExceptionHandler::TokenExpired do |_error|
      render json: { message: "¡Access denied!. Expired token." }, status: :unauthorized
    end
  end
end
