class Task < ActiveRecord::Base
  attr_accessible :url, :exec_time, :executed, :app_token
  validates :url, presence: true
  validates :exec_time, presence: true
end
