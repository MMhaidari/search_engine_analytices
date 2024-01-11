class User < ApplicationRecord
    searchkick
    has_many :searches

    validates :user_ip, presence: true, uniqueness: true
end
