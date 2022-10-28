class Recipe < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :completed, inclusion: [true, false, nil]
end
