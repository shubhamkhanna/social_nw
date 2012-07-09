class AddAttachmentAvtarToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :avtar
      add_column :users, :attach_file_name,    :string
       add_column :users, :attach_content_type, :string
      add_column :users, :attach_file_size,    :integer
      add_column :users, :attach_updated_at,   :datetime


    end
  end

  def self.down
    drop_attached_file :users, :avtar
    remove_column :users, :attach_file_name
     remove_column :users, :attach_content_type
     remove_column :users, :attach_file_size
     remove_column :users, :attach_updated_at

  end
end
