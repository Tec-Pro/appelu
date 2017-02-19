class Api::V1::ReservesController < ApplicationController
	before_action :authenticate, except: [:index,:show]
	before_action :set_reserve, only: [:update,:destroy]
	before_action(only: [:update,:destroy]) { |controlador| controlador.authenticate_owner(@reserve.user) } #TODO agar eidcion para el dueño

				
	#POST /reserves
	def create
		@reserve = Reserve.new(reserve_params)
		if @reserve.save
			render template: "api/v1/reserves/show"
		else
			render json: { error: @reserve.errors }, status: :unprocessable_entity
		end
	end

	#PUT reserves/1
	def update
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
		params.require(:reserve).permit(:comment,:start_time,:end_time,:status,:user_id,:service_id)
	end

	def set_reserve
		@reserve = Reserve.find(params[:id])
	end	

end