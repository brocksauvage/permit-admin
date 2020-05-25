class PermitSubmission < ApplicationRecord
  enum status: %i[accepted filed denied]
  belongs_to :user, optional: true

  attribute :name, :string
  attribute :status, :string
  attribute :user_id, :uuid
  attribute :deadline, :datetime
  attribute :agency, :string
end
