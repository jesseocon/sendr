class Task < ActiveRecord::Base
  attr_accessible :url, :exec_time, :executed, :app_token
  validates :url, presence: true
  validates :exec_time, presence: true
  
  def in_the_future
    response = RestClient.get(self.url)
    puts response
    self.executed = true
    self.save!
  rescue Exception => e
    puts e.message
  end
  handle_asynchronously :in_the_future, run_at: Proc.new { |i| i.exec_time }
end
