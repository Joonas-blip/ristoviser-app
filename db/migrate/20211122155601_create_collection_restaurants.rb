class CreateCollectionRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :collection_restaurants do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
