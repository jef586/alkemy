class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.belongs_to :role
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :image_url
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
