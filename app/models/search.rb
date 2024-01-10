class Search < ApplicationRecord
    belongs_to :user
  
    validates :query, presence: true, length: { minimum: 5, maximum: 100 }
  
    scope :sorted_by_search_query, -> {
      group(:query)
        .select('query, COUNT(*) as total')
        .order('total DESC')
    }
  
    scope :latest_search, -> (user) { where(user: user).order(created_at: :desc).limit(1).first }
  end
  