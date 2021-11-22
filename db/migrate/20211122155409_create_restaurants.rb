class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :tags
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
