class RepliesController < ApplicationController
  respond_to? :html, :js
  def new 
    @reply = Reply.new
  end
  def create
    tweet = Mention.find_by(tweet_id: params[:tweet_id]) 
    status = @client.update("@#{tweet.user_screen_name} #{params[:reply][:body]}", in_reply_to_status_id: params[:tweet_id])
    
    if status = 200 
      flash[:positive] = "Your reply has been sent"
    else
      flash[:negative] = "Error processing ur request"
    end
    
  end
end
