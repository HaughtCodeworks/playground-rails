class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :description
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
