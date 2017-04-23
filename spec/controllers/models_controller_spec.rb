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
    context 'with valid request' do
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

    context 'with invalid request' do
      before do
        get :model_types, model_slug: 'obviously-fake'
      end

      it 'returns error status and message with invalid model_slug' do
        expect(JSON.parse(response.body)['status']).to eq 'error'
        expect(JSON.parse(response.body)['message']).to match /Couldn't find Model/
      end
    end
  end
end
