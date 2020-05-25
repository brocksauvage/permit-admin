# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

attributes = { email: 'example@example.com', password: 'abc123' }
user = User.find_by(attributes.slice(:email))
unless user.present?
  user = User.create!(attributes)
end
user.permit_submissions.create!([
  {
      name: 'Trade Waste Removal License',
      agency: 'NY Department of Motor Vehicles',
      status: 'filed',
      deadline: DateTime.new(2012, 8, 29, 22, 35, 0)
  },
  {
      name: 'Air pollution permit',
      agency: 'New York Battery Park City Authority',
      status: 'denied',
      deadline: DateTime.new(2013, 8, 29, 22, 35, 0),
  },
  {
      name: 'Special truck pollution license',
      agency: 'NY Department of Motor Vehicles',
      status: 'accepted',
      deadline: DateTime.new(2012, 8, 29, 22, 35, 0),
  }
])
PermitSubmission.count
print user.permit_submissions.count
