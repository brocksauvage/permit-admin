unless Team.any?
  [{name: "Main St. Cafe"}, {name: "Sample Team"}, {name: "Uptown Permitting"}].each do |t|
    team = Team.create(t)
  end
end

unless PermitType.any?
  PermitType.create([{ name: "Traffic Permit" }, { name: "Waste Permit" }])
end

unless User.any?
  Team.all.each_with_index do |team, i|
    3.times do |j|
      user = User.create!({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, team_id: team.id, email: "team-#{i}-user-#{j}@example.com", password: 'abc123' })
    end
  end
end

unless Admin.any?
  Team.all.each_with_index do |team, i|
    admin_attributes = { first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, team: team, role: 'manager', email: "team-#{i}-admin@example.com", password: 'abc123' }
    Admin.create!(admin_attributes)
  end
end


unless PermitSubmission.any?
  waste_permit_type = PermitType.find_by_name("Waste Permit")
  traffic_permit_type = PermitType.find_by_name("Traffic Permit")
  permits = [{ name: 'Trade Waste Removal License', agency: 'NY Department of Motor Vehicles', status: 'filed', deadline: Date.today, permit_type_id: waste_permit_type.id},
             { name: 'Air pollution permit', agency: 'New York Battery Park City Authority', status: 'denied', deadline: Date.today, permit_type_id: waste_permit_type.id},
             { name: 'Special truck pollution license', agency: 'NY Department of Motor Vehicles', status: 'accepted', deadline: Date.today, permit_type_id: waste_permit_type.id} ]

  Team.all.each do |team|
    team.users.each_with_index do |user, i|
      user.permit_submissions.create!(permits[i])
    end
  end
end
