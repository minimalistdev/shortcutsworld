class Shortcut < ActiveRecord::Base
  belongs_to :app
  validates :name, presence: true
  validates :pathway, presence: true
  validates :description, presence: true
end
