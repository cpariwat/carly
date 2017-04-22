require 'rails_helper'

RSpec.describe Model, type: :model do
  subject { Fabricate(:model) }

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

  describe 'Association' do
    it { is_expected.to belong_to :organization }
  end
end
