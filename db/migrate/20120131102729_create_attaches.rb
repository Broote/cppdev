class CreateAttaches < ActiveRecord::Migration
  def self.up
    create_table :attaches do |t|
      t.string :name
      t.integer :parent_id
      t.string :parent_type
      t.timestamp :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :attaches
  end
end
