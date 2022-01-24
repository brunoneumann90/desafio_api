class Movie < ApplicationRecord
  include PgSearch::Model

  validates :title, :genre, :year, :country, :published_at, :description, presence: true
  validates :title, uniqueness: true

  pg_search_scope :search_by, against: [:year :genre :country], using: {tsearch: {prefix: true} }

end
