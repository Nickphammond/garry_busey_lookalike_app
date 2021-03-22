class RemoveSuburbsAreasTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :suburbs_areas
  end
end