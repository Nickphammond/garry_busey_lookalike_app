class AddAddressToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :address, foreign_key: true
  end
end
