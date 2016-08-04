class So < ActiveRecord::Base
  has_many :keys
  has_many :apps
  validates :name, presence: true
  validates :img, presence: true
  # , format: {
  #     with: %r{\.jpeg|jpg|png}i,
  #     message: 'must be a jpeg, jpg, or png image.'
  # }
  mount_uploader :img, ImgUploader
end
