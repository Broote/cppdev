# encoding: utf-8

class Attach < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true

  validates_presence_of :name, :message => "can't be blank", :unless => :check_size
  validates_presence_of :upfile_file_size, :message => "can't be blank", :unless => :check_name

  has_attached_file :upfile, :url => "/assets/attaches/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/attaches/:id/:basename.:extension"

  # Или поля пусты, или оба заполнены

  def check_size
    upfile_file_size.nil?
  end

  def check_name
    name==""
  end

end
