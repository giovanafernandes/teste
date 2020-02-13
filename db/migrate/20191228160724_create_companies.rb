class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj
      t.string :business_name, null: true
      t.string :rg, null: true
      t.string :neighborhood, null: true
      t.string :street, null: true
      t.string :number, null: true
      t.string :state, null: true
      t.string :city, null: true
      t.string :zip_code, null: true
      t.string :state_registration, null: true
      t.references :membership, foreign_key: true

      t.timestamps
    end
  end
end
