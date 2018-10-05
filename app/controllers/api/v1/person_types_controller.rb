module Api
  module V1
    class PersonTypesController < ApplicationController
      before_action :set_person_type, only: [:show, :update, :destroy]

      # GET /person_types
      # GET /person_types.json
      def index
        @person_types = PersonType.all
      end

      # GET /person_types/1
      # GET /person_types/1.json
      def show

      end

      # POST /person_types
      # POST /person_types.json
      def create
        @person_type = PersonType.new(person_type_params)
        respond_to do |format|
          if @person_type.save
            format.json { render action: :show, status: :created, object: @person_type }
          else
            format.json { render json: @person_type.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /person_types/1
      # PATCH/PUT /person_types/1.json
      def update
        respond_to do |format|
          if @person_type.update(person_type_params)
            format.json { render action: :show, status: :ok, object: @person_type }
          else
            format.json { render json: @person_type.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /person_types/1
      # DELETE /person_types/1.json
      def destroy
        @person_type.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_person_type
          @person_type = PersonType.find(params[:id])
          return render json: @person_type.errors, status: :unprocessable_entity unless @person_type
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def person_type_params
          params.require(:person_type).permit(:name, :code)
        end
    end
  end
end
