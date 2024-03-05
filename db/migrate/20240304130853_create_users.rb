class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :image
      t.boolean :blocked
      t.boolean :admin

      t.timestamps
    end
  end
end
