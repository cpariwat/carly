require 'rails_helper'

RSpec.describe ModelType, type: :model do
  subject { Fabricate(:model_type) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without model_type_slug' do
      subject.model_type_slug = nil
      expect(subject).not_to be_valid
    end

    it { expect(subject.total_price).not_to eq nil }

    it { is_expected.to validate_uniqueness_of :model_type_slug }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :model }
  end
end
