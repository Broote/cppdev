class AddVersionToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :lock_version, :integer, :default => 0, :null => false
  end
end
