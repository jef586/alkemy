class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.string :image_url, null: false
      t.references :categories, null: false, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :news, :deleted_at
  end
end
