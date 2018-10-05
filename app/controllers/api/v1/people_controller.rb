module Api
  module V1
    class PeopleController < ApplicationController
      before_action :set_person, only: [:show, :update, :destroy]

      # GET /people
      # GET /people.json
      def index
        @people = Person.all
      end

      # GET /people/1
      # GET /people/1.json
      def show; end

      # POST /people
      # POST /people.json
      def create
        @person = Person.new(person_params)
        respond_to do |format|
          if @person.save
            format.json { render :show, status: :created, object: @person }
          else
            format.json { render json: @person.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /people/1
      # PATCH/PUT /people/1.json
      def update
        respond_to do |format|
          if @person.update(person_params)
            format.json { render :show, status: :ok, object: @person }
          else
            format.json { render json: @person.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /people/1
      # DELETE /people/1.json
      def destroy
        @person.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_person
          @person = Person.includes(:person_question, :person_schedule).find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def person_params
          params.require(:person).permit(:first_name, :last_name, :identification, :nationality, :car_plate, :person_type_id, :condominium_id)
        end
    end
  end
end
