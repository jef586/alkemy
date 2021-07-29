class CreateTestimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :testimonials do |t|
      t.string :name, null: false
      t.text :content
      t.string :image_url
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :testimonials, :deleted_at
  end
end
