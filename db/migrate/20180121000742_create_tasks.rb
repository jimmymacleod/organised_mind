class CreateTasks < ActiveRecord::Migration[5.1]

  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.text :importance
      t.integer :day_id
      t.timestamps
    end
  end
end
