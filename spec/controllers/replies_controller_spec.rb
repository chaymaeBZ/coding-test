require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  context 'POST create' do
    before(:each) do
      Mention.create(tweet_id: '943231474354016257', user_screen_name: 'tester')
    end
    it 'should reject when incorrect tweet id' do
      params = { reply: { body: 'a' * 280 }, tweet_id: '943231474354016258' }
      params[:format] = :js
      params[:xhr] = true
      post :create, params: params
      expect(flash[:negative]).to eq 'Error processing your request'

    end

    it 'should reject replies with more than 280 chars' do
      text = 'a' * 281
      rep = Reply.new(body: text)

      params = { reply: { body: rep.body }, tweet_id: '943231474354016257' }
      params[:format] = :js
      params[:xhr] = true
      post :create, params: params

      expect(flash[:negative]).to eq 'Error processing your request'
    end
  end
end
