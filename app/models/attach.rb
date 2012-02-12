class Attach < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true
  has_attached_file :upfile, :url  => "/assets/attaches/:id/:basename.:extension",
                  :path => ":rails_root/public/assets/attaches/:id/:basename.:extension"

end
