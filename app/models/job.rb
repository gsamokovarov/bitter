class Job < ApplicationRecord
  self.table_name = 'delayed_jobs'
end
