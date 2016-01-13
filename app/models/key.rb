class Key < ActiveRecord::Base
  has_many :codes
  belongs_to :so
end
