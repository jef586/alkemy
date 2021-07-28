class AddDeletedAtToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :deletedAt, :datetime
    add_index :activities, :deletedAt
  end
end
