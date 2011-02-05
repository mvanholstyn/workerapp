class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
  end
  def show
    @job = Job.criteria.id(params[:id]).first
  end
  def create
    job = Job.create(params[:job])
    if job.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
end