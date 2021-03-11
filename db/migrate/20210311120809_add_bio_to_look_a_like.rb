class AddBioToLookALike < ActiveRecord::Migration[6.0]
  def change
    add_column :look_a_likes, :bio, :text
  end
end
