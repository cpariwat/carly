module Authenticatable
  extend ActiveSupport::Concern

  module ClassMethods
    def authenticate(email, password)
      actor = self.find_for_authentication(email: email)
      actor.try(:valid_password?, password) ? actor : nil
    end
  end
end