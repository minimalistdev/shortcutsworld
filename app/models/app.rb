class App < ActiveRecord::Base
  belongs_to :so
  has_many :shortcuts
  validates :name, presence: true
  validates :img, presence: true
  mount_uploader :img, ImgUploader
end
