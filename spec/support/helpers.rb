module Helpers
  module OauthHelpers
    def get_access_token(controller)
      token = double :acceptable? => true
      allow(controller).to receive_messages(doorkeeper_token: token)
    end
  end
end

