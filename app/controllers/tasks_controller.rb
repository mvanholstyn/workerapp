class TasksController < ApplicationController
  def index
  end
  
  def next
    task = Task.all.excludes(:status => "pulled").first
    task.update_attributes(:status => "pulled")
    render :json => {
      :id   => task.id,
      :fn   => task.job.function,
      :data => task.data
    }
  end
  
  def result
    task = Task.find(params[:id])
    task.status = "has_result"
    task.result = params[:result]
    task.save
    render :json => {}
  end
end
