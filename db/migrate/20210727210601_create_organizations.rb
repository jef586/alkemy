class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :email
      t.text :welcomeText
      t.text :aboutUsText
      t.string :image_url
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :organizations, :deleted_at
  end
end
