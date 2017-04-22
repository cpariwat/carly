require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject { Fabricate(:organization) }

  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
