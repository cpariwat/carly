require 'rails_helper'

RSpec.describe Api::V1::ModelTypesController, type: :controller do

  describe "POST #model_types_price" do
    it "returns http success" do
      post :model_types_price
      expect(response).to have_http_status(:success)
    end
  end

end
