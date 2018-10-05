module Api
  module V1
    class UserCompetencesController < ApplicationController
      before_action :set_user_competence, only: [:show, :update, :destroy]

      # GET /user_competences
      # GET /user_competences.json
      def index
        @user_competences = UserCompetence.all
      end

      # GET /user_competences/1
      # GET /user_competences/1.json
      def show; end

      # POST /user_competences
      # POST /user_competences.json
      def create
        @user_competence = UserCompetence.new(user_competence_params)
        respond_to do |format|
          if @user_competence.save
            format.json { render :show, status: :created, object: @user_competence }
          else
            format.json { render json: @user_competence.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /user_competences/1
      # PATCH/PUT /user_competences/1.json
      def update
        respond_to do |format|
          if @user_competence.update(user_competence_params)
            format.json { render :show, status: :ok, object: @user_competence }
          else
            format.json { render json: @user_competence.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /user_competences/1
      # DELETE /user_competences/1.json
      def destroy
        @user_competence.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user_competence
          @user_competence = UserCompetence.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_competence_params
          params.require(:user_competence).permit(:user_id, :competence_id, :status, :details)
        end
    end
  end
end
