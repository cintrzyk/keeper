class Item < ActiveRecord::Base
  belongs_to :user
  has_attached_file :document
end
