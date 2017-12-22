require 'rails_helper'

RSpec.describe TweetsController, :type => :controller do
  let(:mentions) { Mention.all }

  context "GET index" do
     before(:each) { get :index, {format: :js, xhr: true} }
    
    it "get all mentions stores them" do 
      expect(assigns[:mentions]).to match_array mentions
    end

    it "renders the index template" do
      
      expect(response).to render_template("index")
    end

  end 
  # stub request wach kadar



end
