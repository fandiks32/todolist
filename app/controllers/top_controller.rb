class TopController < ApplicationController

  def index
    @tasks = Task.all.default_order
  end

  def create
    tasks = Task.all.default_order
    Task.create(description: params[:description], priority: tasks.last&.priority.to_i + 1, deadline: params[:deadline])
    redirect_to action: :index
  end

  def update_status
    task = Task.find(params[:id])
    task.status = params[:status]
    task.save!
  end
end
