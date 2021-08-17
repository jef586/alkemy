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

    rescue_from ActionController::ParameterMissing, with: :render_parameter_missing
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveModel::ValidationError, with: :render_model_errors
    rescue_from CanCan::AccessDenied, with: :render_not_authorized

    private
      def render_not_authorized
        render json: { not_authorized: "Ups.. you shouldn't be here" }, status: :forbidden
      end

      def render_unprocessable_entity(exception)
        render json: { errors: exception.record.errors }, status: :unprocessable_entity
      end

      def render_not_found(exception)
        render json: { error: exception.message }, status: :not_found
      end

      def render_parameter_missing(exception)
        render json: { error: exception.message }, status: :bad_request
      end
  end
end
