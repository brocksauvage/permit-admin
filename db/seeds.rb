
team = Team.create(name: "Main St. Cafe")

PermitType.create([{ name: "Traffic Permit" }, { name: "Waste Permit" }, { name: "NYDoH Food" }])
admin_attributes = { first_name: 'Jane', last_name: 'Doe', team_id: team.id, role: 'manager', email: 'admin@example.com', password: 'abc123' }
admin_user = User.find_by(admin_attributes.slice(:email))
User.create!(admin_attributes) unless admin_user.present?

attributes = { first_name: 'Joe', last_name: 'Smith', team_id: team.id, email: 'example@example.com', password: 'abc123' }
user = User.find_by(attributes.slice(:email))
user = User.create!(attributes) unless user.present?

waste_permit_type = PermitType.find_by_name("Waste Permit")
traffic_permit_type = PermitType.find_by_name("Traffic Permit")

user.permit_submissions.create!([
  {
    name: 'Trade Waste Removal License',
    agency: 'NY Department of Motor Vehicles',
    status: 'closed',
    deadline: Date.today,
    permit_type_id: waste_permit_type.id,
    permittee: 'Test Permittee',
    equipment: 'Equipment',
    location: 'United States'
},
  {
    name: 'Air pollution permit',
    agency: 'New York Battery Park City Authority',
    status: 'in-effect',
    deadline: Date.today,
    permit_type_id: waste_permit_type.id,
    permittee: 'Test Permittee',
    equipment: 'Equipment',
    location: 'United States'
},
    {
    name: 'Special truck pollution license',
    agency: 'NY Department of Motor Vehicles',
    status: 'application',
    deadline: Date.today,
    permit_type_id: waste_permit_type.id,
    permittee: 'Test Permittee',
    equipment: 'Equipment',
    location: 'United States'
}
])
