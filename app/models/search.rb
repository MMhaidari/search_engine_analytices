class Search < ApplicationRecord
    belongs_to :user

    validates :query, presence: true, length: { minimum: 5, maximum: 100 }

    scope :sorted_by_search_count_descending, -> {
        group(:query)
          .select('query, COUNT(*) as total')
          .order('total DESC')
      }
end
