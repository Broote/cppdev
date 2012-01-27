class CreateAttachedFiles < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :file_name
      t.string :content_type
      t.integer :uploadable_id
      t.string :uploadable_type
      t.float :file_size
      t.timestamp :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
