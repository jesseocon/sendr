class App < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :url, :verified
  
  validates :name, presence: true
  validates :url, presence: true
  
  before_create :generate_api_key
  
  scope :readable_by, lambda { |user_id| where(user_id: user_id) }
  
  private
    def generate_api_key
      begin
        self.api_key = SecureRandom.hex
      end while self.class.exists?(api_key: api_key)
    end
end
