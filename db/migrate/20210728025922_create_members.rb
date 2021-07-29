class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :facebook_url
      t.string :instagram_url
      t.string :linkedin_url
      t.string :description
      t.datetime :deleted_at
      t.string :image_url

      t.timestamps
    end
  end
end
