class AddAuthenticationFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :provider, :string
    add_column :users, :uid, :integer
    add_attachment :users, :image
  end

  def self.down
    remove_column :users, :provider
    remove_column :users, :uid
    remove_attachment :users, :image
  end
end
