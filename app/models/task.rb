class Task < ActiveRecord::Base
  attr_accessible :url, :exec_time, :executed, :app_token, :method, :command_url
  attr_accessor :method, :command_url
  delegate :query, :query_string, :params, :port, :host, :protocol, :path, :proto_host, to: :command_url
  validates :url, presence: true
  validates :exec_time, presence: true
  
  after_initialize :command_url
  
  def in_the_future
    response = self.pick_call
    self.executed = true
    self.save!
  rescue Exception => e
    puts e.message
  end
  response = handle_asynchronously :in_the_future, run_at: Proc.new { |i| i.exec_time }
  puts response
  
  def method=(method)
    @method = method.downcase rescue nil
  end
  
  def method
    @method
  end
  
  def pick_call
    case self.method
    when 'get'
      self.get_url
    when 'post'
      self.post_url
    when 'put'
      self.post_url
    when 'delete'
      self.delete_url
    else
      self.get_url
    end
  end
  
  def command_url
    @command_url ||= CommandUrl.new(url_string: self.url)
  end
  
  def post_url
    RestClient.post(@command_url.proto_host, @command_url.params)
  end
  
  def put_url
    RestClient.post(@command_url.proto_host, @command_url.params)
  end
  
  def delete_url
    RestClient.delete(self.url)
  end
  
  def get_url
    RestClient.get(@command_url.proto_host, @command_url.params)
  end
end
# RestClient.post('http://localhost:3000/tasks, {url: 'mogreet.com', exec_time: '2013-09-17 05:49:00 000', method: 'get'} )







