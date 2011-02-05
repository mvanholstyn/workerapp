require 'lib/heroku_resque_auto_scale'

module SegmentData
  if Rails.env == "production"
    extend HerokuResqueAutoScale
  end
  @queue = :segment_data

  def self.perform(job_id)
    job = Job.criteria.id(job_id).first
    until job.data.empty?
      job.tasks.create(:data => job.data.pop)
    end
  end
end

