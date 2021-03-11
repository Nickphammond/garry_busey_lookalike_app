class AddListedAttributeToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :listed, :boolean
  end
end
