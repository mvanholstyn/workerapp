class Job
  include Mongoid::Document
  field :name
  field :function
  field :data
  references_many :tasks
end