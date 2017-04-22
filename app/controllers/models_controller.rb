class ModelsController < ApplicationController
  def model_types
    render json: Model.find_by(model_slug: params[:model_slug])
  end
end
