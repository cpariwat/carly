class ModelsController < ApplicationController
  def model_types
    car_models = Model.where(model_slug: params[:model_slug])
    render json: car_models
  end
end
