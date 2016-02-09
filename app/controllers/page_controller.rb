class PageController < ApplicationController
  def index
    begin
      @soSelected = So.find(params[:so_id])
    rescue ActiveRecord::RecordNotFound => e
      @soSelected = So.new
    end

    gon.soSelectedId = @soSelected.id

    @so = So.new
    @sos = So.all
  end
end
