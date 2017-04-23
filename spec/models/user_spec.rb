require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = Fabricate(:user)
      expect(user).to be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      subject.password = '12345678'
      expect(subject).to_not be_valid
    end

    it 'is not valid without password' do
      subject.email = 'test@example.com'
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
