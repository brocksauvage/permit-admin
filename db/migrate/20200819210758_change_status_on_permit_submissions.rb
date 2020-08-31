class ChangeStatusOnPermitSubmissions < ActiveRecord::Migration[6.0]
  def change
    change_column :permit_submissions, :status, :string
  end
end
