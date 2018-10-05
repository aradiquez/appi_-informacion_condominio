module Api
  module V1
    class CompetencesController < ApplicationController
      before_action :set_competence, only: [:show, :update, :destroy]

      # GET /competences
      # GET /competences.json
      def index
        @competences = Competence.all
      end

      # GET /competences/1
      # GET /competences/1.json
      def show
      end

      # POST /competences
      # POST /competences.json
      def create
        @competence = Competence.new(competence_params)
        respond_to do |format|
          if @competence.save
            format.json { render :show, status: :created, object: @competence }
          else
            format.json { render json: @competence.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /competences/1
      # PATCH/PUT /competences/1.json
      def update
        respond_to do |format|
          if @competence.update(competence_params)
            format.json { render :show, status: :ok, object: @competence }
          else
            format.json { render json: @competence.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /competences/1
      # DELETE /competences/1.json
      def destroy
        @competence.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_competence
          @competence = Competence.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def competence_params
          params.require(:competence).permit(:code, :name, :required, :active, :competence_type_id)
        end
    end
  end
end
