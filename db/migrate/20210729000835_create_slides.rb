class CreateSlides < ActiveRecord::Migration[6.1]
  def change
    create_table :slides do |t|
      t.belongs_to :organization
      t.string :image_url, null: false
      t.text :text
      t.integer :order

      t.timestamps
    end
  end
end
