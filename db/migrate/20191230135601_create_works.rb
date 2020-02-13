class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.date :start
      t.date :end
      t.boolean :isFinished
      t.string :budget
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true
      t.references :branch, foreign_key: true

      t.timestamps
    end
  end
end
