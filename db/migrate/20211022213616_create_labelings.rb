class CreateLabelings < ActiveRecord::Migration[5.2]
  def change
    create_table :labelings do |t|
      t.references :task, foreign_key: true
      t.references :label, foreign_key: true

      t.timestamps
    end
  end
end
