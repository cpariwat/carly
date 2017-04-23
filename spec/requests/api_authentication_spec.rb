require "rails_helper"

describe 'API authentication' , type: :request do
  let(:organization) { Fabricate(:organization) }
  let(:model_types) { Fabricate.times(3, :model_type) }
  let(:model) { Fabricate(:model, organization: organization, model_types: model_types) }

  it 'cannot make a request without valid token' do
    get "/models/#{model.model_slug}/model_types"
    expect(response).to have_http_status(:unauthorized)
  end

  it 'can get token with valid user email and password' do
    user = Fabricate(:user, password: '12345678')
    post "/oauth/token", {grant_type: "password", email: user.email, password: '12345678'}
    expect(respond['token']).to_not be_nil
  end
end