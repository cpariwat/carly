require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject { Fabricate(:organization) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many :model }
  end
end
