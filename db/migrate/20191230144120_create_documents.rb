class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :path
      t.references :diary, foreign_key: true

      t.timestamps
    end
  end
end
