class AddBranchIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :branch, foreign_key: true
  end
end
