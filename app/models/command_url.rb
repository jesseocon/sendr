class CommandUrl
  attr_accessor :url_string, :base_url, :query, :query_string, :params
  attr_accessor :port, :host, :protocol, :path, :proto_host
  
  URL_START = Regexp.new('(\Ahttp:\/\/|https:\/\/)')
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    @base_url ||= URI.parse(self.url_string)
  end
  
  def url_string=(url_string)
    if URL_START.match(url_string).nil?
      @url_string = 'http://' + url_string
    else
      @url_string = url_string
    end
  end
  
  def base_url
    @base_url = URI.parse(self.url_string)
  end
  
  def query
    @query = base_url.query rescue ''
  end
  
  def query_string
    @query_string = '?' + self.query rescue ''
  end
  
  def params
    params = {}
    if self.query
      array = self.query.split('&')
      array.each do |arr|
        a = arr.split('=')
        params[a[0]] = a[1]
      end
    end

    @params = params
  end
  
  def port
    if self.host == 'localhost'
      @port = ':' + base_url.port.to_s
    else
      @port = ''
    end
  end
  
  def host
    @host = base_url.host
  end
  
  def protocol
    if self.base_url.scheme.nil?
      @protocol = 'http'
    else
      @protocol = base_url.scheme
    end
  end
  
  def path
    @path = base_url.path
  end
  
  def proto_host
    host_and_proto = self.protocol + '://' + self.host + self.port + self.path
  end
  
end





