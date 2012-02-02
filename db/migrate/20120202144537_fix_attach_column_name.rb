class FixAttachColumnName < ActiveRecord::Migration
  def up
    rename_column :attaches, :parent_id, :uploadable_id
    rename_column :attaches, :parent_type, :uploadable_type
  end

  def down
    rename_column :attaches, :uploadable_id, :parent_id
    rename_column :attaches, :uploadable_type, :parent_type
  end
end
