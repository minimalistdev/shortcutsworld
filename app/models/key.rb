class Key < ActiveRecord::Base
  validates :name, presence: true
  has_and_belongs_to_many :shortcuts
  has_many :codes
  belongs_to :so
end
