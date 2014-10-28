class SirTrevorFile < ActiveRecord::Base
  has_attached_file :file

  validates_attachment_content_type :file, content_type: ['application/pdf', 'image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  def as_json(options={})
    {
      file: {
        url: self.file.url
      }
    }
  end
end
