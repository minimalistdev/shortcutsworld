class So < ActiveRecord::Base
  has_many :keys
  has_many :apps
  validates :name, presence: true
  validates :img, presence: true
  mount_uploader :img, ImgUploader
end
