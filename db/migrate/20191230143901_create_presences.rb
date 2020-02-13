class CreatePresences < ActiveRecord::Migration[5.2]
  def change
    create_table :presences do |t|
      t.boolean :isPresent
      t.time :period
      t.references :diary, foreign_key: true
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
