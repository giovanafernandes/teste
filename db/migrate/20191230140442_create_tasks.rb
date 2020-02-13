class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :isFinished, :default => 0
      t.string :justification
      t.integer :priority
      t.references :color, foreign_key: true
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
