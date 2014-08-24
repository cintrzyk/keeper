class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  has_attached_file :image

  validates_attachment :image, content_type: {
                                 content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
                               }
end
