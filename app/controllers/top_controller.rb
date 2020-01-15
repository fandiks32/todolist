class TopController < ApplicationController

  def index
    @tasks = Task.all.default_order
  end

  def create
    tasks = Task.all.default_order
    Task.create(description: params[:description], priority: tasks.last&.priority.to_i + 1)
    redirect_to action: :index
  end
end
