class CreateAClasses < ActiveRecord::Migration
  def change
    create_table :a_classes do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
      add_index :a_classes, [:user_id, :created_at]
  end
end
