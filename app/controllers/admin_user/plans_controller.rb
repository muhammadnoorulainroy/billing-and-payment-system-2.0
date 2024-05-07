# frozen_string_literal: true

module AdminUser
  class PlansController < ApplicationController
    require 'stripe'
    layout 'admin'
    before_action :set_plan, only: %i[show destroy]

    def index
      @pagy, @plans = pagy(Plan.all, items: 5)
      authorize @plans
    end

    def show
      respond_to do |format|
        format.js
      end
    end

    def new
      @plan = Plan.new
      authorize @plan
    end

    def create
      @plan = Plan.new(plan_params)
      authorize @plan
      if @plan.save!
        redirect_to admin_plans_url, flash: { success: 'Plan created successfully' }
      else
        render :new
      end
    end

    def destroy
      @plan.destroy
      redirect_to admin_plans_url, flash: { success: 'Plan was successfully deleted.' }
    end

    private

    def set_plan
      @plan = Plan.find(params[:id])
      authorize @plan
    end

    def plan_params
      params.require(:plan).permit(:name, feature_ids: [])
    end
  end
end
