class AddMoviesToEvents < ActiveRecord::Migration[6.0]
  def change

    create_table :movies_events do |t|
      t.references :event, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
