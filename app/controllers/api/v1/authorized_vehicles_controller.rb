module Api
  module V1
    class AuthorizedVehiclesController < ApplicationController
      before_action :set_authorized_vehicle, only: [:show, :update, :destroy]

      # GET /authorized_vehicles
      # GET /authorized_vehicles.json
      def index
        @authorized_vehicles = AuthorizedVehicle.all
      end

      # GET /authorized_vehicles/1
      # GET /authorized_vehicles/1.json
      def show
      end

      # POST /authorized_vehicles
      # POST /authorized_vehicles.json
      def create
        @authorized_vehicle = AuthorizedVehicle.new(authorized_vehicle_params)
        respond_to do |format|
          if @authorized_vehicle.save
            format.json { render :show, status: :created, object: @authorized_vehicle }
          else
            format.json { render json: @authorized_vehicle.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /authorized_vehicles/1
      # PATCH/PUT /authorized_vehicles/1.json
      def update
        respond_to do |format|
          if @authorized_vehicle.update(authorized_vehicle_params)
            format.json { render :show, status: :ok, object: @authorized_vehicle }
          else
            format.json { render json: @authorized_vehicle.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /authorized_vehicles/1
      # DELETE /authorized_vehicles/1.json
      def destroy
        @authorized_vehicle.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_authorized_vehicle
          @authorized_vehicle = AuthorizedVehicle.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def authorized_vehicle_params
          params.require(:authorized_vehicle).permit(:car_plate, :brand, :color, :style, :other, :condominium_id)
        end
    end
  end
end
