class AddDocumentToItems < ActiveRecord::Migration
  def self.up
    add_attachment :items, :document
  end

  def self.down
    remove_attachment :items, :document
  end
end
