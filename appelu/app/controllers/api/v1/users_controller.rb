require 'bcrypt'

class Api::V1::UsersController < ApplicationController
	before_action :authenticate, only: [:update]
	before_action :set_user, only: [ :show,:update]
	# POST /users
	def create
		#params = { auth:{ provider: 'facebook', uid:'12adsashd71' } }

		if params[:password]
			@user = User.new(user_params)
			@user.save!
			@token = @user.tokens.create

			render "api/v1/users/show"
		elsif params[:auth]
			@user = User.from_omniauth(params[:auth])
			@token = @user.tokens.create

			render "api/v1/users/show"	
		
		else
			render json: { error: "No encontramos parámetros" }
		end	

	end

	def update
		@current_user.update(user_update_params)
		render "api/v1/businesses/show"		
	end

	def show		
	end

	def index
		@users = User.all
	end


def login
	if params[:token]	
		authenticate
	else		
		@user = User.find_by_email(params[:email])
		if @user.password == params[:password]
			@current_user = @user
			@token = @user.tokens.create #mejorar
	  	else
			error!("Tu contrseña es inválida", :unauthorized)
	  	end
	end
	render "api/v1/users/show"  	
end

def reserves
	@current_user.reserves
end

def recovery
	@user = User.find_by_email(params[:email])
	if @user.present?
	  random_password = Array.new(10).map { (65 + rand(58)).chr }.join
	  @user.password = random_password
	  @user.save!
	  Mailer.create_and_deliver_password_change(@user, random_password)
	  render json: { message: "Su nueva contrseña ha sido enviada a su email" 	, status: :ok }
	else
			error!("Usuario inexistente", :not_found)  
	end 
end

	private

		def user_params
			params.permit(:email,:password,:phone,:role) 
		end

		def user_update_params
			params.permit(:password,:phone,:role) 
		end

end