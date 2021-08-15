class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.belongs_to :category
      t.belongs_to :user
      t.string :name, null: false
      t.text :content, null: false
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :news, :deleted_at
  end
end
