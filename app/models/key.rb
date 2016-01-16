class Key < ActiveRecord::Base
  validates :name, presence: true
  has_many :codes
  belongs_to :so
end
