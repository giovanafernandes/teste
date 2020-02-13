class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.string :cnpj
      t.boolean :active
      t.references :card
      t.references :access_key

      t.timestamps
    end
  end
end
