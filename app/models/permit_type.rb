class PermitType < ApplicationRecord
  attribute :name, :string
  has_many :permit_submissions
end
