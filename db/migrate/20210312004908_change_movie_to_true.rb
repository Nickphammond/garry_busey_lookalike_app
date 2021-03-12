class ChangeMovieToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:events_look_a_likes, :movie_id, true)
  end
end
