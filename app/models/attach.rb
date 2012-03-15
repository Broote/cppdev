# encoding: utf-8
# config/locales/ru.yml

class Attach < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true

  validates_presence_of :name, :message => "Выберите имя загружаемого файла"
  validates_presence_of :upfile_file_size, :message => "Вы не выбрали файл"

  has_attached_file :upfile, :url  => "/assets/attaches/:id/:basename.:extension",
                  :path => ":rails_root/public/assets/attaches/:id/:basename.:extension"


end
