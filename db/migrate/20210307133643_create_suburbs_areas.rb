class CreateSuburbsAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :suburbs_areas do |t|
      t.references :look_a_like, null: false, foreign_key: true
      t.references :suburb, null: false, foreign_key: true

      t.timestamps
    end
  end
end
