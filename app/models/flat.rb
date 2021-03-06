class Flat < ApplicationRecord
  belongs_to :user
  validates_presence_of(:address, :capacity, :description, :price, :title, :photo)
  has_many_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_country_capacity, against: [:address]
end
