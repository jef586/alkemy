# frozen_string_literal: true

class ApplicationController < ActionController::API
    include ExceptionHandler

    #to prove the authentication on Postman
    protect_from_forgery with: :null_session
end
