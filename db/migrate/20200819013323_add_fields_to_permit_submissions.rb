class AddFieldsToPermitSubmissions < ActiveRecord::Migration[6.0]
  def change
    change_column :permit_submissions, :status, :integer,  using: 'status::integer'
    add_column :permit_submissions, :permittee, :text
    add_column :permit_submissions, :equipment, :text
    add_column :permit_submissions, :location, :text
  end
end
