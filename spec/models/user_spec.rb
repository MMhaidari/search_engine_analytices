require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_ip) }
    it { should validate_uniqueness_of(:user_ip) }
  end

  describe 'associations' do
    it { should have_many(:searches) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      user = User.new(user_ip: '127.0.0.1')
      expect(user).to be_valid
    end
  end

  describe 'attributes' do
    it 'has user_ip attribute' do
      user = User.new(user_ip: '127.0.0.1')
      expect(user.user_ip).to eq('127.0.0.1')
    end
  end
end
