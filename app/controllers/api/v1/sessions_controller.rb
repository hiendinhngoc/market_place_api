class Api::V1::SessionsController < ApplicationController
  
  def create
  	user_password = params[:session][:password]
  	ueser_email = params[:session][:email]
  	user = ueser_email.present? && User.find_by(email: ueser_email)

  	if user.valid_password? user_password
  	  sign_in user, store: false
  	  user.generate_authentication_token!
  	  user.save
  	  render json: user, status: 200, location: [:api, user]
  	else
  	  render json: { errors: "Invalid email or password" }, status: 422
  	end
  end
end
