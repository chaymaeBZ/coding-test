class TweetsController < ApplicationController
  before_action :get_client
  def index
    @mentions = @client.mentions_timeline
  end

  private
    def get_client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "g8NHEcHbsv7ZLE8O2ys3OVvm3"
        config.consumer_secret     = "Rg0Dt2eUBSgCxW9JzPN0DvfcPgqGlgNILG0QT55SSV0dhgIyMZ"
        config.access_token        = "806582927022813186-7ZjDASKVhV6Qn7rvl0qvIUwSFXBSX9x"
        config.access_token_secret = "2i8IKzOiRNdofQ3BzjR6IC4vyXoNBAqi5bW2IyUU8ZO7h"
        config.proxy = {
          host: '10.23.201.11', port: 3128,
    username: "",
    password: ""
        }
        
      end

    end
end
