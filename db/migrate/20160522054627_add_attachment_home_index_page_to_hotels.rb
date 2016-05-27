class AddAttachmentHomeIndexPageToHotels < ActiveRecord::Migration
  def self.up
    change_table :hotels do |t|
      t.attachment :home
      t.attachment :index
      t.attachment :page
    end
  end

  def self.down
    remove_attachment :hotels, :home
    remove_attachment :hotels, :index
    remove_attachment :hotels, :page
  end
end
