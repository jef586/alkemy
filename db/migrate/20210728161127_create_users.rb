class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.belongs_to :role
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :image_url
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :email,                unique: true
  end
end
