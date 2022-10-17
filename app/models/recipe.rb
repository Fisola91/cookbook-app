class Recipe < ActiveRecord::Base
  validates :name, :description, presence: true
end
