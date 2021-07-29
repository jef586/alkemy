class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
