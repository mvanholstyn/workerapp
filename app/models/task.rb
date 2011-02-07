class Task
  include Mongoid::Document
  field :data
  field :result
  field :status
  referenced_in :job, :inverse_of => :tasks
end