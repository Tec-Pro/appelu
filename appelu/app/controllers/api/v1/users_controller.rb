require 'bcrypt'

class Api::V1::UsersController < ApplicationController
	
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

	private

		def user_params
			params.permit(:email,:password,:phone,:role) 
		end



end