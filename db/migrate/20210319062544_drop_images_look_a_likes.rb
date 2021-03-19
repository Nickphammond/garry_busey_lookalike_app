class DropImagesLookALikes < ActiveRecord::Migration[6.0]

    def change
        drop_join_table :images, :look_a_likes
    end

end
