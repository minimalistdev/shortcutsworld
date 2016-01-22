class PageController < ApplicationController
  def index
    @so = So.new
    @sos = So.all
  end
end
