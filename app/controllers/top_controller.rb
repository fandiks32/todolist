class TopController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.by_user(current_user).default_order
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        tasks = Task.by_user(current_user).default_order
        Task.create!(description: params[:description],
                     priority: tasks.last&.priority.to_i + 1,
                     deadline: params[:deadline],
                     user: current_user)
      end
    rescue ActiveRecord::RecordInvalid => @e
      return false
    end
    redirect_to action: :index
  end

  def update_status
    begin
      ActiveRecord::Base.transaction do
        task = Task.find(params[:id])
        task.status = params[:status]
        task.save!
      end
    rescue ActiveRecord::RecordInvalid => @e
      return false
    end
  end
end
