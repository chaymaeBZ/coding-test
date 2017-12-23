class RepliesController < ApplicationController
  respond_to? :html, :js
  def new
    @reply = Reply.new
  end

  def create
    tweet = Mention.find_by!(tweet_id: params[:tweet_id])
    _response = @client.update(
               "#{params[:reply][:body]}",
                 in_reply_to_status_id: params[:tweet_id] 
                )

    # Scenario 1.0 :
    #
    # _response = @client.update(
    #             "@#{tweet.user_screen_name} #{params[:reply][:body]}",
    #              in_reply_to_status_id: params[:tweet_id]
    #              )
    #
    # For more complexe use case
    # where client wants the reply tweet to apear in replies section ...

    flash[:positive] = 'Your reply has been sent'
  rescue Twitter::Error::Forbidden, ActiveRecord::RecordNotFound
    flash[:negative] = 'Error processing your request'
  end
end
