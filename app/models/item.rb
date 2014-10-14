class Item < ActiveRecord::Base
  CONTENT_TYPES = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  belongs_to :user
  has_attached_file :document

  validates :user, presence: true
  validates_attachment :document, content_type: { content_type: CONTENT_TYPES }

  def to_jq_upload
    {
      name: document_file_name,
      size: document_file_size,
      url: document.url(:original),
      created_at: created_at.to_s(:short)
    }
  end
end
