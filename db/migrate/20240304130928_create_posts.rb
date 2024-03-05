class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :view_counter, default: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
