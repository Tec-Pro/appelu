class Api::V1::ReservesController < ApplicationController
	before_action :authenticate, except: [:index,:show]
	before_action :set_reserve, only: [:update,:destroy]
	before_action :set_service, only: [:create]
	before_action :set_user, only: [:create,:update]
	before_action(only: [:destroy]) { |controlador| controlador.authenticate_owner(@reserve.user) } #TODO agar eidcion para el dueño

	def index

		if params[:user_id]
			@reserves = Reserve.where("user_id = #{params[:user_id]}")
			return 
		end

		if params[:service_id]
			@reserves = Reserve.where("service_id = #{params[:service_id]}")
			return 
		end

		render json: { error: "no encontramos parametros"}	
	end
	#POST /reserves
	def create

		@reserve = Reserve.new(reserve_params)
		if @reserve.save
			print "dia de la reservaaaa: #{(@reserve.start_time+0.days).strftime("%A") }"
			render template: "api/v1/reserves/show"
		else
			render json: { error: @reserve.errors }, status: :unprocessable_entity
		end
	end

	#PUT reserves/1
	def update
		puts "hola: #{@reserve}"
		if @reserve.update(reserve_params)
			render template: "api/v1/reserves/show"
		else
			render json: { error: @reserve.errors }, status: :unprocessable_entity
		end
	end

	#DELETE /reserves/1
	def destroy
		@reserve.destroy
		head :ok
	end

	private

	def reserve_params
		params.permit(:comment,:start_time,:end_time,:status,:user_id,:service_id)
	end

	def set_reserve
		@reserve = Reserve.find(params[:id])
	end	

	def set_service
		@service = Service.find(params[:service_id])
	end	

	def set_user
		@user = User.find(params[:user_id])
	end	


end