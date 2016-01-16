class App < ActiveRecord::Base
  belongs_to :so
  has_many :shortcuts
  validates :name, presence: true
end
