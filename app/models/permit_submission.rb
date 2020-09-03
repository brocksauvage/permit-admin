class PermitSubmission < ApplicationRecord
  include PgSearch::Model

  enum status: {closed: "closed", ineffect: "in-effect", application: "application"}

  acts_as_taggable_on :tags

  belongs_to :user
  belongs_to :permit_type

  alias_attribute :creator, :user
  has_many :permit_documents, dependent: :destroy
  delegate :name, to: :user, prefix: true

  accepts_nested_attributes_for :permit_documents, allow_destroy: true

  attribute :name, :string
  attribute :status, :string
  attribute :user_id, :uuid
  attribute :deadline, :datetime
  attribute :agency, :string

  validates :user_id, :presence => true

  pg_search_scope :search_permits,
                  against: %i[name agency],
                  associated_against: {
                    permit_type: :name
                  },
                  using: { tsearch: { dictionary: 'english' } }
end
