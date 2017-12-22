require 'rails_helper'

RSpec.describe RepliesController, :type => :controller do
  


  context "POST create" do
    
    it "should reject incorrect tweet id" do
    end

    it "should reject replies with more than 280 chars" do
      text = "a" * 281
      rep = Reply.new(body: text)
    

      params = { reply: { body: rep.body }, tweet_id: "943231474354016257" } 
      params.merge!(format: :js, xhr: true)
      post :create, params: params

      expect(flash[:negative]).to eq "Error processing ur request"

    end

  end  



end
