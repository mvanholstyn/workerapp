class Task
  include Mongoid::Document
  field :data
  field :result
  field :status
  embedded_in :job, :inverse_of => :tasks
end