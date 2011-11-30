class RemoveColumnsFromUsers < ActiveRecord::Migration
    def self.up
    remove_column :users, :crypted_password, :salt
  end

  def self.down
    add_column :users,  :crypted_password, :string
    add_column :users,  :salt, :string
  end
end
