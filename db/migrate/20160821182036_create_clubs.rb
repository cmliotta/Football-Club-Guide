class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :description
      t.string :primary_color
      t.string :secondary_color
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end
end
