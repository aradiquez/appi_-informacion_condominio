module Api
  module V1
    class CompetenceTypesController < ApplicationController
      before_action :set_competence_type, only: [:show, :update, :destroy]

      # GET /competence_types
      # GET /competence_types.json
      def index
        @competence_types = CompetenceType.all
      end

      # GET /competence_types/1
      # GET /competence_types/1.json
      def show
      end

      # POST /competence_types
      # POST /competence_types.json
      def create
        @competence_type = CompetenceType.new(competence_type_params)
        respond_to do |format|
          if @competence_type.save
            format.json { render :show, status: :created, object: @competence_type }
          else
            format.json { render json: @competence_type.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /competence_types/1
      # PATCH/PUT /competence_types/1.json
      def update
        respond_to do |format|
          if @competence_type.update(competence_type_params)
            format.json { render :show, status: :ok, object: @competence_type }
          else
            format.json { render json: @competence_type.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /competence_types/1
      # DELETE /competence_types/1.json
      def destroy
        @competence_type.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_competence_type
          @competence_type = CompetenceType.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def competence_type_params
          params.require(:competence_type).permit(:code, :name, :type, :required, :details)
        end
    end
  end
end
