class CreateDays < ActiveRecord::Migration[5.1]

  def change
    create_table :days do |t|
      t.date :date
      t.text :journal
      t.text :image
      t.timestamps
    end
  end
end
