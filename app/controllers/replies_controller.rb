class RepliesController < ApplicationController
  respond_to? :html, :js
  def new 
    @reply = Reply.new
  end
  def create
  end
end
