class PageController < ApplicationController
  def index
    @so = So.new
  end
end
