class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :thinker
      t.integer :follower

      t.timestamps
    end
  end
end
