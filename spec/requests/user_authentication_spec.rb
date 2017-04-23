require "rails_helper"

describe 'User authentication' , type: :request do
  let(:organization) { Fabricate(:organization) }
  let(:model_types) { Fabricate.times(3, :model_type) }
  let(:model) { Fabricate(:model, organization: organization, model_types: model_types) }

  context 'with valid user email and password' do
    let(:user) { Fabricate(:user, password: '12345678') }

    it 'can get access token' do
      post '/oauth/token', grant_type: 'password', email: user.email, password: '12345678'
      expect(JSON.parse(response.body)['access_token']).to_not be_nil
    end
  end

  context 'with invalid user email and password' do
    let(:user) { Fabricate(:user, password: '12345678') }

    it 'cannot get access token' do
      post '/oauth/token', grant_type: 'password', email: user.email, password: 'not_12345678'
      json_body = JSON.parse(response.body)
      expect(json_body['access_token']).to be_nil
      expect(json_body['error']).to eq 'invalid_grant'
    end
  end
end