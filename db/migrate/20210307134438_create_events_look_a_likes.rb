class CreateEventsLookALikes < ActiveRecord::Migration[6.0]
  def change
    create_table :events_look_a_likes do |t|
      t.references :event, null: false, foreign_key: true
      t.references :look_a_like, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.boolean :look_a_like_accepted
      t.boolean :host_accepted
      t.boolean :invite

      t.timestamps
    end
  end
end
