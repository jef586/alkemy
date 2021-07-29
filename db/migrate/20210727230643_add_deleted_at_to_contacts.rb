class AddDeletedAtToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :deletedAt, :datetime
    add_index :contacts, :deletedAt
  end
end
