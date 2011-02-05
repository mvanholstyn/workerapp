class TasksController < ApplicationController
  def index
  end
  
  def next
    task = Task.create(:function => "function(data) { return data + #{rand(1000)}; }", :data => rand(1000))
    render :json => {
      :id => task.id,
      :fn => task.function,
      :data => task.data
    }
  end
  
  def result
    task = Task.find(params[:id])
    task.result = params[:result]
    task.save
    render :json => {}
  end
end
