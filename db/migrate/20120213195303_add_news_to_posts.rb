class AddNewsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :news, :boolean

  end
end
