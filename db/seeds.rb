attributes = { email: 'example@example.com', password: 'abc123' }
user = User.find_by(attributes.slice(:email))
user = User.create!(attributes) unless user.present?
user.permit_submissions.create!([
  {
    name: 'Trade Waste Removal License',
    agency: 'NY Department of Motor Vehicles',
    status: 'filed',
    deadline: Date.today
},
  {
    name: 'Air pollution permit',
    agency: 'New York Battery Park City Authority',
    status: 'denied',
    deadline: Date.today
},
{
    name: 'Special truck pollution license',
    agency: 'NY Department of Motor Vehicles',
    status: 'accepted',
    deadline: Date.today
  }
])
