require 'rails_helper'

RSpec.describe Model, type: :model do
  let(:organization) { Fabricate(:organization) }
  let(:model_types) { Fabricate.times(3, :model_type) }

  subject {
    Fabricate(:model,
              organization: organization,
              model_types: model_types)
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without model_slug' do
      subject.model_slug = nil
      expect(subject).not_to be_valid
    end

    it { is_expected.to validate_uniqueness_of :model_slug }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :organization }
    it { is_expected.to have_many :model_types }
  end
end
