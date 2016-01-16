class So < ActiveRecord::Base
  has_many :keys
  has_many :apps
  validates :name, presence: true
end
