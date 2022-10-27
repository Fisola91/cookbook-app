class Recipe < ActiveRecord::Base
  attr_reader :completed
  validates :name, :description, presence: true
  validates :completed, inclusion: [true, false, nil]
end
