class AddAttachmentImageToContacts < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :contacts, :image
  end
end
