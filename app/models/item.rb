class Item < ActiveRecord::Base
  belongs_to :user
  has_attached_file :document

  validates_attachment :document, content_type: {
                                    content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
                                  }

  def to_jq_upload
    {
      name: document_file_name,
      size: document_file_size,
      url: document.url(:original),
      created_at: created_at.to_s(:short)
    }
  end
end
