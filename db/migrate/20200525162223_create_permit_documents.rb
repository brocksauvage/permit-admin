class CreatePermitDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :permit_documents, id: :uuid do |t|
      t.belongs_to :permit_submission, type: :uuid, index: true, null: false
      t.timestamps
    end
  end
end
