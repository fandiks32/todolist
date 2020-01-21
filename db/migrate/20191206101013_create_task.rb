class CreateTask < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer   :user_id
      t.string    :description
      t.integer   :priority
      t.string    :status
      t.timestamp :deadline
    end
  end
end
