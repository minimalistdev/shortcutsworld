class Shortcut < ActiveRecord::Base
  has_and_belongs_to_many :keys
  belongs_to :app
  validates :name, presence: true
  validates :description, presence: true
end
