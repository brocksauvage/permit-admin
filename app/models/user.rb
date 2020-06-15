class User < ApplicationRecord
  has_many :permit_submissions
  belongs_to :team

  enum role: { manager: 'manager', user: 'user' }

  attribute :first_name, :string
  attribute :last_name, :string
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def name
    "#{first_name} #{last_name}"
  end
end
