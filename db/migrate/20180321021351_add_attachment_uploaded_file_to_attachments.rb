class AddAttachmentUploadedFileToAttachments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :attachments do |t|
      t.attachment :uploaded_file
    end
  end

  def self.down
    remove_attachment :attachments, :uploaded_file
  end
end
