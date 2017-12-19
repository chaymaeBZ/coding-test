class Mention < ApplicationRecord
  validates :tweet_id, uniqueness: true
end
