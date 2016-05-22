class SearchController < ApplicationController
  include ApplicationHelper
  def create
    @search_query = params[:search]
    conditions = { term: 'brewery'}

    @results = yelp_client.search(@search_query, conditions).businesses

    if request.xhr?
      render :json => @results
    else
      redirect_to '/'
    end
  end
end
