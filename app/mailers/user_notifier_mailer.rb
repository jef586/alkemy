# frozen_string_literal: true

class UserNotifierMailer < ApplicationMailer
  # Send a signup email to the user
  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
    subject: "Gracias por registrarte en Somos Mas!")
  end
  # Notifies the user when they contact the organization
  def send_successful_contact_email(contact)
    @contact = contact
    mail(to: @contact.email,
    subject: "Gracias por contactarnos!",
    body: "Hola " + @contact.name + "!, gracias por ponerte en contacto con nosotros. En breve nos comunicaremos contigo.")
  end
end
