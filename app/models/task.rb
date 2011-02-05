class Task
  include Mongoid::Document
  field :data
  field :result
  embedded_in :job, :inverse_of => :tasks
end