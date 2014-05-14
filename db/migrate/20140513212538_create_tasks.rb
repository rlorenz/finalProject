class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :dueDate
      t.integer :a_class_id

      t.timestamps
    end
      add_index :tasks, [:a_class_id, :created_at]
  end
end
