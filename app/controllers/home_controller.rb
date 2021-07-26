# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    render json: { message: "Welcome :D This is the Somos-Mas API" }
  end
end
