class CreatePermitTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :permit_types, id: :uuid do |t|
      t.string :name
    end

    add_column :permit_submissions, :permit_type_id, :uuid, null: false
  end
end
