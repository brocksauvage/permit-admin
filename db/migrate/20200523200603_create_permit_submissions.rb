class CreatePermitSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permit_submissions, id: :uuid do |t|
      t.string :name
      t.string :agency
      t.datetime :deadline
      t.string :status

      t.belongs_to :user, type: :uuid, index: true, null: false

      t.timestamps
    end
  end
end
