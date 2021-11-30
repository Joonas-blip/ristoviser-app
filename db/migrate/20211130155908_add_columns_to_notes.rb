class AddColumnsToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :price, :string
    add_column :notes, :rating, :integer
  end
end
