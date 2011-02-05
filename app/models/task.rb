class Task
  include Mongoid::Document
  
  field :function
  field :data
  field :result
end