class Post < ApplicationRecord
  belongs_to :user, index: true, foreign_key: true
end
