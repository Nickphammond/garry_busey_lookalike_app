class CreateLookALikes < ActiveRecord::Migration[6.0]
  def change
    create_table :look_a_likes do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
