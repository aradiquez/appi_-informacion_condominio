module Api
  module V1
    class QuestionsController < ApplicationController
      before_action :set_question, only: [:show, :update, :destroy]

      # GET /questions
      # GET /questions.json
      def index
        @questions = Question.all
      end

      # GET /questions/1
      # GET /questions/1.json
      def show; end

      # POST /questions
      # POST /questions.json
      def create
        @question = Question.new(question_params)
        respond_to do |format|
          if @question.save
            format.json { render action: :show, status: :created, object: @question }
          else
            format.json { render json: @question.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /questions/1
      # PATCH/PUT /questions/1.json
      def update
        respond_to do |format|
          if @question.update(question_params)
            format.json { render action: :show, status: :ok, object: @question }
          else
            format.json { render json: @question.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /questions/1
      # DELETE /questions/1.json
      def destroy
        @question.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_question
          @question = Question.find(params[:id])
          unless @question
            render json: nil, status: :unprocessable_entity && return
          end
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def question_params
          params.require(:question).permit(:question, :active, :required, :person_type_id)
        end
    end
  end
end
