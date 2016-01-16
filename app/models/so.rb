class So < ActiveRecord::Base
  has_many :keys
  validates :name, presence: true
end
