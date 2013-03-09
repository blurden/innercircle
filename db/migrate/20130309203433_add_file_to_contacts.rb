class AddFileToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :file, :string
  end
end
