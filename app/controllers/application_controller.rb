class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_client

  private

  def get_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['consumer_key']
      config.consumer_secret     = ENV['consumer_secret']
      config.access_token        = ENV['access_token']
      config.access_token_secret = ENV['access_token_secret']
      config.proxy = {
        host: '10.23.201.11', port: 3128,
        username: "",
        password: ""
      }
    end
  end
end
