require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:models) { Fabricate.times(3, :model) }
  subject { Fabricate(:organization, models: models) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many :models }
  end
end
