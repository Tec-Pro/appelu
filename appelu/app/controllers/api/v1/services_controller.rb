class Api::V1::ServicesController < ApplicationController
	before_action :authenticate, except: [:index,:show]
	before_action :set_service, only: [ :show,:update,:destroy ]
	before_action :set_business
	before_action(only: [:update,:destroy,:create]) { |controlador| controlador.authenticate_owner(@business.user) }



	def indexAll
		@services = Service.all
	end

	#GET /businesses/:business_id/services
	def index
		@services = @business.services
	end

	#GET /businesses/1/services/2
	def show
	end


	#POST /businesses/1/services
	def create
		@service = @business.services.new(service_params)
		if @service.save
			render template: "api/v1/services/show"
		else
			render json: { error: @service.errors }, status: :unprocessable_entity
		end
	end

	#PATCH PUT /businesses/1/services/1
	def update
		if @service.update(service_params)
			render template: "api/v1/services/show"
		else
			render json: { error: @service.errors }, status: :unprocessable_entity
		end
	end

	#DELETE /businesses/1/services/1
	def destroy
		@service.destroy
		head :ok
	end


	private

	def service_params
		params.permit(:name,:duration,:enable) 
	end

	def set_business
		@business = Business.find(params[:business_id])
	end

	def set_question
		@service = Service.find(params[:id])
	end	

end