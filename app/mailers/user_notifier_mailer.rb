# frozen_string_literal: true

class UserNotifierMailer < ApplicationMailer
  # Send a signup email to the user, pass in the user object that contains the user's email address
  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
    subject: "Thanks for signing up to our amazing app",
    body: "Acá va a el mensaje, tengo que eliminar al poner un template")
  end
end
