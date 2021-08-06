# frozen_string_literal: true

class UsersController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def profile
    if authenticate?
      @current_user = current_user
    else
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
