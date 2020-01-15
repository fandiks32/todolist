class Task < ActiveRecord::Base

  scope :default_order, -> { order(priority: :asc, description: :asc) }
  validates :priority, numericality: { only_integer: true, allow_nil: false, message: 'Error value on Priority' }
  validates :description, presence: true
end
