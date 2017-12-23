class TweetsController < ApplicationController
  respond_to? :html, :js
  def index
    @mentions = @client.mentions_timeline.map do |mention|
      Mention.create(
        tweet_id: mention.id,
        text: mention.full_text,
        username: mention.user.name,
        user_screen_name: mention.user.screen_name
      )
    end
    # pry
  end
end
