class PermitSubmission < ApplicationRecord
  enum status: %i[accepted filed denied]
  belongs_to :user
  belongs_to :permit_type

  alias_attribute :creator, :user
  has_many :permit_documents, dependent: :destroy
  delegate :name, to: :user, prefix: true

  attribute :name, :string
  attribute :status, :string
  attribute :user_id, :uuid
  attribute :deadline, :datetime
  attribute :agency, :string
end
