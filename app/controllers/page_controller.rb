class PageController < ApplicationController
  def index
  	@courses = Course.all
  end
end
