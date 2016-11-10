class Shortcut < ActiveRecord::Base
  belongs_to :app
  validates :name, presence: true
  validates :shortcut, presence: {message: "must have at least one key"}
  validates :description, presence: true
end
