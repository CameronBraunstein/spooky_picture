class Spooker < ApplicationRecord
  validates :name, :presence => true
  validates :month, :presence => true
end
