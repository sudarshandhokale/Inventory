class HomeController < ApplicationController
  def index
    @count ||= Store.all_count
  end
end
