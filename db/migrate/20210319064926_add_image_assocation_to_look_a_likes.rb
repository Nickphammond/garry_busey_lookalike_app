class AddImageAssocationToLookALikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :look_a_likes, :image, foreign_key: true
  end
end
