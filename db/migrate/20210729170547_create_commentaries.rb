class CreateCommentaries < ActiveRecord::Migration[6.1]
  def change
    create_table :commentaries do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.text :body, null: false

      t.timestamps
    end
  end
end
