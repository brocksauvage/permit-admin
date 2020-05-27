class PermitDocument < ApplicationRecord
  has_one_attached :document
  belongs_to :permit_submission

  attribute :permit_submission_id, :uuid
end
