class CreateSlides < ActiveRecord::Migration[6.1]
  def change
    create_table :slides do |t|
      t.belongs_to :organization
      t.text :text, null: false
      t.integer :order

      t.timestamps
    end
    add_index :slides, :order, unique: true
  end
end
