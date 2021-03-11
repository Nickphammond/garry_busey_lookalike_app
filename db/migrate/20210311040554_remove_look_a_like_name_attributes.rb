class RemoveLookALikeNameAttributes < ActiveRecord::Migration[6.0]
  def change
    remove_column :look_a_likes, :first_name
    remove_column :look_a_likes, :last_name
  end
end
