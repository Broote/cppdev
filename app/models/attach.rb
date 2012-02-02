class Attach < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true
  
  #attr_accessor :upfile
  has_attached_file :upfile
  #attr_accessible :upfile
end
