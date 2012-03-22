class TwitterUpdatesController < ApplicationController
  # def new
  #   render :text => session.keys.inspect
  # end
  
  def create
    Twitter.configure do |config|
      config.consumer_key = TWITTER_KEY
      config.consumer_secret = TWITTER_SECRET
      config.oauth_token = session["twitter_token"]
      config.oauth_token_secret = session["twitter_token_secret"]
    end
    
    Twitter.update(params[:tweet])
    flash[:notice] = "You have tweeted stuff, go check."
    
    redirect_to "/"
  end
end
