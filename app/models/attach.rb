# encoding: utf-8

class Attach < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true

  validates_presence_of :name, :message => "can't be blank'"
  validates_presence_of :upfile_file_size, :message => "can't be blank'"

  has_attached_file :upfile, :url  => "/assets/attaches/:id/:basename.:extension",
                  :path => ":rails_root/public/assets/attaches/:id/:basename.:extension"


end
