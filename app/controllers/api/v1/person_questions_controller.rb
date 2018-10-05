module Api
  module V1
    class PersonQuestionsController < ApplicationController
      before_action :set_person_question, only: [:show, :update, :destroy]

      # GET /person_questions
      # GET /person_questions.json
      def index
        @person_questions = PersonQuestion.all
      end

      # GET /person_questions/1
      # GET /person_questions/1.json
      def show
      end

      # POST /person_questions
      # POST /person_questions.json
      def create
        @person_question = PersonQuestion.new(person_question_params)
        respond_to do |format|
          if @person_question.save
            format.json { render :show, status: :created, object: @person_question }
          else
            format.json { render json: @person_question.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /person_questions/1
      # PATCH/PUT /person_questions/1.json
      def update
        respond_to do |format|
          if @person_question.update(person_question_params)
            format.json { render :show, status: :ok, object: @person_question }
          else
            format.json { render json: @person_question.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /person_questions/1
      # DELETE /person_questions/1.json
      def destroy
        @person_question.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_person_question
          @person_question = PersonQuestion.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def person_question_params
          params.require(:person_question).permit(:person_id, :question_id)
        end
    end
  end
end
