class AddPriceToEventsLookALikes < ActiveRecord::Migration[6.0]
  def change
    add_column :events_look_a_likes, :price, :integer
  end
end
