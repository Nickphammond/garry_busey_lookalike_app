class CreateSuburbsLookALikes < ActiveRecord::Migration[6.0]
  def change
    create_table :suburbs_look_a_likes do |t|
      t.references :suburb, null: false, foreign_key: true
      t.references :look_a_like, null: false, foreign_key: true

      t.timestamps
    end
  end
end
