class CreateNotes < ActiveRecord::Migration[5.1]

  def change
    create_table :notes do |t|
      t.text :title
      t.text :detail
      t.text :image
      t.integer :day_id
      t.timestamps
    end
  end
end
