class Task < ActiveRecord::Base

  scope :default_order, -> { order(status: :asc, priority: :asc, description: :asc) }
  validates :priority, numericality: { only_integer: true, allow_nil: false, message: 'Error value on Priority' }
  validates :description, presence: true

  def done?
    status == 'done'
  end
end
