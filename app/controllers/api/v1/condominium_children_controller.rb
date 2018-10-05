module Api
  module V1
    class CondominiumChildrenController < ApplicationController
      before_action :set_condominium_child, only: [:show, :update, :destroy]

      # GET /condominium_children
      # GET /condominium_children.json
      def index
        @condominium_children = CondominiumChild.all
      end

      # GET /condominium_children/1
      # GET /condominium_children/1.json
      def show; end

      # POST /condominium_children
      # POST /condominium_children.json
      def create
        @condominium_child = CondominiumChild.new(condominium_child_params)
        respond_to do |format|
          if @condominium_child.save
            format.json { render :show, status: :created, object: @condominium_child }
          else
            format.json { render json: @condominium_child.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /condominium_children/1
      # PATCH/PUT /condominium_children/1.json
      def update
        respond_to do |format|
          if @condominium_child.update(condominium_child_params)
            format.json { render :show, status: :ok, object: @condominium_child }
          else
            format.json { render json: @condominium_child.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /condominium_children/1
      # DELETE /condominium_children/1.json
      def destroy
        @condominium_child.destroy
        respond_to do |format|
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_condominium_child
          @condominium_child = CondominiumChild.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def condominium_child_params
          params.require(:condominium_child).permit(:first_name, :last_name, :identification, :car_plate, :condominium)
        end
    end
  end
end
