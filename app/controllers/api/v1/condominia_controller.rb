module Api
  module V1
    class CondominiaController < ApplicationController
      before_action :set_condominium, only: [:show, :update, :destroy]

      # GET /condominia
      # GET /condominia.json
      def index
        @condominia = Condominium.all
      end

      # GET /condominia/1
      # GET /condominia/1.json
      def show
      end

      # POST /condominia
      # POST /condominia.json
      def create
        @condominium = Condominium.new(condominium_params)
        respond_to do |format|
          if @condominium.save
            format.json { render :show, status: :created, object: @condominium }
          else
            format.json { render json: @condominium.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /condominia/1
      # PATCH/PUT /condominia/1.json
      def update
        respond_to do |format|
          if @condominium.update(condominium_params)
            format.json { render :show, status: :ok, object: @condominium }
          else
            format.json { render json: @condominium.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /condominia/1
      # DELETE /condominia/1.json
      def destroy
        @condominium.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_condominium
          @condominium = Condominium.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def condominium_params
          params.require(:condominium).permit(:first_name, :last_name, :identification, :filial_number, :phone_number, :status, :active, :birthday)
        end
    end
  end
end
