class TasksController < ApplicationController
  respond_to :json
  
  def index
    render :nothing => true
  end
  
  def show
    render :nothing => true
  end
  
  def next
    task = Task.where(:status => nil).first
    if task
      task.update_attributes(:status => "pulled")
      data = { :id => task.id, :fn => Job.find(task.job_id).function, :data => task.data }
    else
      data = { :nodata => true }
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
