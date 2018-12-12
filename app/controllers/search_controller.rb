class SearchController < ApplicationController
  def index
    @facade = SearchFacade.new(params[:q])
    binding.pry
  end
end