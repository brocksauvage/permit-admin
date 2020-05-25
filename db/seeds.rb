attributes = { email: 'example@example.com', password: 'abc123' }
user = User.find_by(attributes.slice(:email))
user = User.create!(attributes) unless user.present?
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
    deadline: Date.new('08-10-1990')
  },
  {
    name: 'Special truck pollution license',
    agency: 'NY Department of Motor Vehicles',
    status: 'accepted',
    deadline: Date.new('08-10-1990')
  }
])
PermitSubmission.count
print user.permit_submissions.count
