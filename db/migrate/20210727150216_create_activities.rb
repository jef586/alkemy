class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :image
      t.text :content
      t.date :deletedAt

      t.timestamps
    end
  end
end
