class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.boolean :public, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
