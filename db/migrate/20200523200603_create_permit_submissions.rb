class CreatePermitSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permit_submissions do |t|
      t.string :title

      t.timestamps
    end
  end
end
