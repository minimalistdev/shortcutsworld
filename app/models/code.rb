class Code < ActiveRecord::Base
  validates :char, presence: true
  belongs_to :key
end
