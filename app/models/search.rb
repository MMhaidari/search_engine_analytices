class Search < ApplicationRecord
    belongs_to :user

    validates :query, presence: true, length: { minimum: 5, maximum: 100 }
end
