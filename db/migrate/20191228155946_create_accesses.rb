class CreateAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :accesses do |t|
      t.boolean :toCreate
      t.boolean :toRead
      t.boolean :toUpdate
      t.boolean :toDelete

      t.timestamps
    end
  end
end
