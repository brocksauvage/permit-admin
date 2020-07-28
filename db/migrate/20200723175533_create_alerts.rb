class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.text :body
      t.string :link

      t.timestamps
    end
  end
end
