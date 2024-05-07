# frozen_string_literal: true

# Features Controller
module AdminUser
  class FeaturesController < ApplicationController
    layout 'admin'
    before_action :set_feature, only: %i[show edit update destroy]

    def index
      @pagy, @features = pagy(Feature.all, items: 5)
      authorize @features
    end

    def show
      respond_to do |format|
        format.js
      end
    end

    def new
      @feature = Feature.new
      authorize @feature
    end

    def edit; end

    def create
      @feature = Feature.new(create_feature_params)
      authorize @feature
      if @feature.save
        redirect_to admin_features_url, flash: { success: 'Feature was successfully created.' }
      else
        render :new
      end
    end

    def update
      if @feature.update(update_feature_params)
        redirect_to admin_features_url, flash: { success: 'Feature was successfully updated.' }
      else
        render :edit
      end
    end

    def destroy
      @feature.destroy
      redirect_to admin_features_url, flash: { success: 'Feature was successfully deleted.' }
    end

    private

    def set_feature
      @feature = Feature.find(params[:id])
      authorize @feature
    end

    def create_feature_params
      params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit)
    end

    def update_feature_params
      params.require(:feature).permit(:name, :code, :max_unit_limit)
    end
  end
end
