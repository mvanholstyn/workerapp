class Job
  include Mongoid::Document
  field :name
  field :function
  field :data
  embeds_many :tasks
end