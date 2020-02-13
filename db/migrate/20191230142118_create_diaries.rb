class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :hr_observation, null: true
      t.string :third_observation, null: true
      t.string :observation, null: true
      t.datetime :start, null: true
      t.datetime :end, null: true
      t.references :work, foreign_key: true
      t.references :weather, foreign_key: true

      t.timestamps
    end
  end
end
