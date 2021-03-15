class AddDefaultPriceToEventsLookALikes < ActiveRecord::Migration[6.0]
  def change
    change_column :events_look_a_likes, :price, :integer, :default => 50
  end
end
