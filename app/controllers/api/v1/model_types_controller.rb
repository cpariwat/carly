class Api::V1::ModelTypesController < ApplicationController
  def model_types_price
    model = Model.find_by!(model_slug: params[:model_slug])

    model_type = model.model_types.find_by!(model_type_slug: params[:model_type_slug])
    model_type.base_price = model_types_price_params

    if model_type.save
      render json: model_type
    else
      render json: {status: 'error', message: model_type.errors.full_messages.to_sentence}
    end
  end

  private

  def model_types_price_params
    params.required(:base_price)
  end
end
