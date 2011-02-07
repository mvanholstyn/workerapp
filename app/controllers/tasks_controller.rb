class TasksController < ApplicationController
  respond_to :json
  
  def index
    render :nothing => true
  end
  
  def show
    render :nothing => true
  end
  
  def next
    task = Task.all.excludes(:status => "pulled").first
    if task
      task.update_attributes(:status => "pulled")
      data = { :id => task.id, :fn => task.job.function, :data => task.data }
    else
      data = { :id => nil, :fn => nil, :data => nil}
    end
    respond_with(data.to_json)
  end
  
  def result
    task        = Task.find(params[:id])
    task.status = "has_result"
    task.result = params[:result]
    task.save
    respond_with({ :ok => true }.to_json)
  end
end
