module Api
  module V1
    class PersonSchedulesController < ApplicationController
      before_action :set_person_schedule, only: [:show, :update, :destroy]

      # GET /person_schedules
      # GET /person_schedules.json
      def index
        @person_schedules = PersonSchedule.all
      end

      # GET /person_schedules/1
      # GET /person_schedules/1.json
      def show; end

      # POST /person_schedules
      # POST /person_schedules.json
      def create
        @person_schedule = PersonSchedule.new(person_schedule_params)
        respond_to do |format|
          if @person_schedule.save
            format.json { render :show, status: :created, object: @person_schedule }
          else
            format.json { render json: @person_schedule.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /person_schedules/1
      # PATCH/PUT /person_schedules/1.json
      def update
        respond_to do |format|
          if @person_schedule.update(person_schedule_params)
            format.json { render :show, status: :ok, object: @person_schedule }
          else
            format.json { render json: @person_schedule.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /person_schedules/1
      # DELETE /person_schedules/1.json
      def destroy
        @person_schedule.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_person_schedule
          @person_schedule = PersonSchedule.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def person_schedule_params
          params.require(:person_schedule).permit(:person_id, :start_time, :end_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :holidays)
        end
    end
  end
end
