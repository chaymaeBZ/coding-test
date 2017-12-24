require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  let(:mentions_tweet_id) { Mention.all.map { |m| m[:tweet_id] } }
  let(:client) { Twitter::REST::Client.new }

  context 'GET index' do
    before(:each) do
      get :index, format: :js, xhr: true
    end

    it 'gets all mentions, and stores them' do
      expect(client).to be_instance_of(Twitter::REST::Client)
      expect(assigns[:mentions].map { |m| m[:tweet_id] }).to match_array mentions_tweet_id
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
end
