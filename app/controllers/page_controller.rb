class PageController < ApplicationController
  def index
    begin
      if !params[:app_id] .nil?
        @appSelected = App.find_by_id!(params[:app_id])
        gon.appSelectedId = @appSelected.id
        gon.soSelectedId = @appSelected.so.id
      elsif !params[:so_id].nil?
        @soSelected = So.find_by_id!(params[:so_id])
        gon.soSelectedId = @soSelected.id
      end
    rescue ActiveRecord::RecordNotFound => e
      @soSelected = So.new
    end

    @so = So.new
    @sos = So.all
  end
end
