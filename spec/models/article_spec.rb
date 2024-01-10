require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(8).is_at_most(250) }
  end

  describe 'scopes' do
    describe 'search_title' do
      it 'returns articles with a matching title' do
        article1 = Article.create(title: 'Ruby on Rails for Beginners')
        article2 = Article.create(title: 'Advanced Ruby Techniques')
        article3 = Article.create(title: 'Rails Best Practices')

        result = Article.search_title('Ruby')

        expect(result).to include(article1, article2)
        expect(result).not_to include(article3)
      end
    end
  end
end
