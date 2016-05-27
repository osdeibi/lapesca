class AddAttachmentSmallToHotels < ActiveRecord::Migration
  def self.up
    change_table :hotels do |t|
      t.attachment :small
    end
  end

  def self.down
    remove_attachment :hotels, :small
  end
end
