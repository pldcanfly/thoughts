class CreateLoves < ActiveRecord::Migration[5.0]
  def change
    create_table :loves do |t|
      t.integer :thinker
      t.integer :thought

      t.timestamps
    end
  end
end
