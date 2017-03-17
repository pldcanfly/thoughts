class AddDetailsToThinkers < ActiveRecord::Migration[5.0]
  def change
    add_column :thinkers, :age, :integer
    add_column :thinkers, :thouhgs, :integer
    add_column :thinkers, :profession, :string
    add_column :thinkers, :active, :boolean, default: false
    add_column :thinkers, :city, :string
  end
end
