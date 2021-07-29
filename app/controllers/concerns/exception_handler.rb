# frozen_string_literal: true

module ExcepctionHandler extend ActiveSupport::Concern
                         class TokenInvalid < StandardError; end
                         class TokenExpired < StandardError; end
                         included do
                           rescue_from ExcepctionHandler::TokenInvalid do |_error|
                             render json: { message: "¡Access denied!. Invalid token." }, status: :unauthorized
                           end
                           rescue_from ManejadorDeExcepciones::TokenExpirado do |_error|
                             render json: { message: "¡Access denied!. Expired token." }, status: :unauthorized
                           end
                         end
end
