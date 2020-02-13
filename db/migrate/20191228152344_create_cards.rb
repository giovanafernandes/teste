class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :cpf
      t.string :number
      t.datetime :validate
      t.string :security_code

      t.timestamps
    end
  end
end
