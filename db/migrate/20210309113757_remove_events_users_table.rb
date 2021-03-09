class RemoveEventsUsersTable < ActiveRecord::Migration[6.0]
  def change
      drop_join_table :events, :users
  end
end
