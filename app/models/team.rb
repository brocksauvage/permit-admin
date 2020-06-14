class Team < ApplicationRecord
  has_many :users
  has_many :permit_submissions, through: :users
end
