class IndexController < ApplicationController
  include ApplicationHelper
  def index
    render template: '/index/index', locals: { user: current_user }
  end
end
