class Shortcut < ActiveRecord::Base
  belongs_to :app
  validates :name, presence: true
  validates :shortcut, format: {with: /.+ \+ .+/, message: "must have at least two keys"}
  validates :description, presence: true
end
