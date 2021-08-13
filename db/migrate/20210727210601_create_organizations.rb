class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :address
      t.string :phone
      t.string :email, null: false
      t.text :welcome_text, null: false
      t.text :about_us_text
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :organizations, :deleted_at
  end
end
