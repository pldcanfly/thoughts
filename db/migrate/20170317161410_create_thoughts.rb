class CreateThoughts < ActiveRecord::Migration[5.0]
  def change
    create_table :thoughts do |t|
      t.string :text
      t.integer :author
      t.integer :likes
      t.integer :parent

      t.timestamps
    end
  end
end
