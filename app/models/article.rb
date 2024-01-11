class Article < ApplicationRecord
    searchkick text_middle: %i[title, body]
end
