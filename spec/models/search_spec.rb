# spec/models/search_spec.rb

require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:query) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
