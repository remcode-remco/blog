class CreateSources < ActiveRecord::Migration[7.1]
  def change
    create_table :sources do |t|
      t.string :url
      t.string :title
      t.integer :position
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
