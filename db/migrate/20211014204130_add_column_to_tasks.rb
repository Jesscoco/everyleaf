class AddColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :ending_date, :date
  end
end
