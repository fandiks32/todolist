class Task < ActiveRecord::Base
  belongs_to :user
  
  scope :default_order, -> { order(status: :desc, priority: :asc, description: :asc) }
  scope :by_user, ->(user) { where(user: user) }
  validates :priority, numericality: { only_integer: true, allow_nil: false, message: 'Error value on Priority' }
  validates :description, presence: true

  def done?
    status == 'done'
  end
end
