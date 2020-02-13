class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :description
      t.boolean :third
      t.float :salary, null: true
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
