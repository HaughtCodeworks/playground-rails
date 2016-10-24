class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :slug
      t.references :project, foreign_key: true

      t.timestamps
    end
    add_index :lists, [:project_id, :slug], unique: true
  end
end
