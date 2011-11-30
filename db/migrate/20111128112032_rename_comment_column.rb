class RenameCommentColumn < ActiveRecord::Migration
  def self.up
    rename_column :comments, :parent_id, :commentable_id
    rename_column :comments, :parent_type, :commentable_type
  end

  def self.down
    rename_column :comments, :commentable_id, :parent_id
    rename_column :comments, :commentable_type, :parent_type
  end
end