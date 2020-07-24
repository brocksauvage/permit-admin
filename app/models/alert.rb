class Alert < ApplicationRecord
  include PgSearch::Model

  validates :body, :presence => true

  pg_search_scope :search_by_body, against: :body,
                  using: { tsearch: { dictionary: 'english' } }
end
