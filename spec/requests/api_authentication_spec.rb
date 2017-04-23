require "rails_helper"

describe 'API authentication' , type: :request do
  let(:organization) { Fabricate(:organization) }
  let(:model_types) { Fabricate.times(3, :model_type) }
  let(:model) { Fabricate(:model, organization: organization, model_types: model_types) }

  context 'with valid access token' do
    let(:user) { Fabricate(:user, password: '12345678') }

    it 'can make an api request and return expected result' do
      user = Fabricate(:user, password: '12345678')
      post '/oauth/token', grant_type: 'password', email: user.email, password: '12345678'
      access_token = JSON.parse(response.body)['access_token']

      get "/models/#{model.model_slug}/model_types", access_token: access_token
      expect(response).to have_http_status(:success)
      expect(response).to match_response_schema('models')
    end
  end

  context 'without valid access token' do
    it 'cannot make a request' do
      get "/models/#{model.model_slug}/model_types", access_token: 'obviously_fake'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end