class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 8, maximum: 250 }

    scope :search_title, ->(query) { where('title ILIKE ?', "%#{query}%") }
end
