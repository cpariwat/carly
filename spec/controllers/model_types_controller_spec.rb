require 'rails_helper'

RSpec.describe Api::V1::ModelTypesController, type: :controller do
  include Helpers::OauthHelpers

  let(:organization) { Fabricate(:organization) }
  let(:model_type) { Fabricate(:model_type) }
  let(:model) { Fabricate(:model, organization: organization, model_types: [model_type]) }

  before do
    get_access_token(controller)
  end

  describe "POST #model_types_price" do
    before do
      post :model_types_price,
           model_slug: model.model_slug,
           model_type_slug: model_type.model_type_slug,
           base_price: model_type.base_price
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'response with a JSON body with expected ModelTypes format' do
      expect(response).to match_response_schema("modelType")
    end
  end

end
