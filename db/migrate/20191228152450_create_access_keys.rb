class CreateAccessKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :access_keys do |t|
      t.string :key
      t.datetime :start_period
      t.datetime :end_period
      t.boolean :isUsed
      t.boolean :isTestingKey

      t.timestamps
    end
  end
end
