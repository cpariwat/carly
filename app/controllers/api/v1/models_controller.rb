class Api::V1::ModelsController < ApplicationController
  def model_types
    car_model = Model.where(model_slug: params[:model_slug])

    if car_model.any?
      render json: car_model
    else
      raise ActiveRecord::RecordNotFound, "Couldn't find Model"
    end
  end
end
