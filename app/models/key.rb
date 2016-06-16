class Key < ActiveRecord::Base
  validates :char, presence: true
  has_and_belongs_to_many :shortcuts
  belongs_to :so
end
