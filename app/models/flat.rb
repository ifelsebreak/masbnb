class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :photo
  include PgSearch::Model
  pg_search_scope :search_by_country_capacity, against: [:address, :capacity]
end
