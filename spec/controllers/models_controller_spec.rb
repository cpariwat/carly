require 'rails_helper'

RSpec.describe Api::V1::ModelsController, type: :controller do
  include Helpers::OauthHelpers

  let(:organization) { Fabricate(:organization) }
  let(:model_types) { Fabricate.times(3, :model_type) }
  let(:model) { Fabricate(:model, organization: organization, model_types: model_types) }

  before do
    get_access_token(controller)
  end

  describe 'GET #model_types' do
    before do
      get :model_types, model_slug: model.model_slug
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'response with a JSON body with expected ModelTypes format' do
      expect(response).to match_response_schema("models")
    end
  end
end
