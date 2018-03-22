class Attachment < ApplicationRecord
  belongs_to :user
  attr_accessor :user_id, :uploaded_file



  has_attached_file :uploaded_file,
                    :url => "/attachments/picture/:id",
                    :path => "/www/sf_workspace/sharebox/attachments/:id/:basename.:extension"


  validates_attachment_content_type :uploaded_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif","pdf"]
  validates_attachment_size :uploaded_file, :less_than => 10.megabytes
  validates_attachment_presence :uploaded_file


  def file_name
    uploaded_file_file_name
  end

  def file_size
    uploaded_file_file_size
  end

end
