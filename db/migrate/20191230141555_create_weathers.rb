class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.string :type
      t.boolean :impracticable

      t.timestamps
    end
  end
end
