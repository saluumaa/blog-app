class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :photo
      t.string :bio, limit: 500
      t.integer :posts_counter, default: 0
      t.timestamps
    end
  end
end
