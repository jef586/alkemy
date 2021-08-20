class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.belongs_to :from_user
      t.string :name, null: false
      t.string :phone_number, null: false
      t.text :message
      t.string :email, null: false
      t.datetime :deleted_at
      
      t.timestamps
    end
    add_index :contacts, :deleted_at
  end
end
