require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  let(:organization) { Fabricate(:organization) }
  let(:model_types) { Fabricate.times(3, :model_type) }
  let(:model) { Fabricate(:model, organization: organization, model_types: model_types) }

  describe 'GET #index' do
    it 'returns http success' do
      get :model_types, model_slug: model.model_slug
      expect(response).to have_http_status(:success)
    end

    it 'response with a JSON body with expected ModelTypes format' do
      expect(response).to match_response_schema("models")
    end
  end
end
