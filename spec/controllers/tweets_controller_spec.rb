require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  let(:mentions) { Mention.all }
  let(:client) { Twitter::REST::Client.new }

  context 'GET index' do
    before(:each) do
      get :index, format: :js, xhr: true
    end

    it 'gets all mentions, and stores them' do
      expect(client).to be_instance_of(Twitter::REST::Client)
      expect(assigns[:mentions]).to match_array mentions
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end
end
