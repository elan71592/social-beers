class TweetsController < ApplicationController
  include ApplicationHelper
  def index
  end

  def create
    name = params[ :name ].split( ' ' )
    search_tweets = twitter_helper.user_search( params[:name] ).first
    if search_tweets != nil
      if request.xhr?
        render :json => {screen_name: search_tweets.screen_name}
      end
    end
  end
end
