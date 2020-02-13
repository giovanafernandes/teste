class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.boolean :main
      t.string :name
      t.string :cnpj
      t.references :membership, foreign_key: true
      t.string :zip_code, null: true
      t.string :neighborhood, null: true
      t.string :street, null: true
      t.string :number, null: true
      t.string :state, null: true
      t.string :state_registration, null: true

      t.timestamps
    end
  end
end
