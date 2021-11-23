class AddColumnsToRestaurant < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :country, :string
    add_column :restaurants, :street_address, :string
  end
end
