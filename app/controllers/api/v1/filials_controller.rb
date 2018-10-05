module Api
  module V1
    class FilialsController < ApplicationController
      before_action :set_filial, only: [:show, :update, :destroy]

      # GET /filial
      # GET /filial.json
      def index
        @filials = Filial.includes(
          :condominiums,
          :condominium_childs,
          :authorized_vehicles,
          :people
        ).all
      end

      # GET /filial/1
      # GET /filial/1.json
      def show
        return render json: 'Filial not found #{params[:id]} is not on our DB.', status: :unprocessable_entity unless @filial
      end

      # POST /filial
      # POST /filial
      def create
        @filial = Filial.new(filial_params)
        respond_to do |format|
          if @filial.save
            format.json { render :show, status: :created, object: @filial }
          else
            format.json { render json: @filial.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /filial/1
      # PATCH/PUT /filial/1.json
      def update
        respond_to do |format|
          if @filial.update(filial_params)
            format.json { render :show, status: :ok, object: @filial }
          else
            format.json { render json: @filial.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /filial/1
      # DELETE /filial/1.json
      def destroy
        @filial.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Never trust parameters from the scary internet, only allow the white list through.
        def filial_params
          raise params.inspect
          params.require(:filial).permit(:number, :condominiums, :condominium_childs, :authorized_vehicles, :people)
        end

        def set_filial
          @filial = Filial.includes(
            :condominiums,
            :condominium_childs,
            :authorized_vehicles,
            :people
          ).where(number: params[:id]).first
        end
    end
  end
end
