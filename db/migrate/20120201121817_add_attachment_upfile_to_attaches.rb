class AddAttachmentUpfileToAttaches < ActiveRecord::Migration
  def self.up
    add_column :attaches, :upfile_file_name, :string
    add_column :attaches, :upfile_content_type, :string
    add_column :attaches, :upfile_file_size, :integer
    add_column :attaches, :upfile_updated_at, :datetime
  end

  def self.down
    remove_column :attaches, :upfile_file_name
    remove_column :attaches, :upfile_content_type
    remove_column :attaches, :upfile_file_size
    remove_column :attaches, :upfile_updated_at
  end
end
