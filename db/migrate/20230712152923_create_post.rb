class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 50
      t.text :text
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
