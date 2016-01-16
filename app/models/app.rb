class App < ActiveRecord::Base
  belongs_to :so
  validates :name, presence: true
end
