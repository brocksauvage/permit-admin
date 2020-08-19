class Team < ApplicationRecord
  has_many :users
  has_many :admins
  has_many :permit_submissions, through: :users

  def manager_name
    users.where(role: 'manager').first.name
  end
end
