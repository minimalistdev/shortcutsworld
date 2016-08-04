class SosController < ApplicationController
  def new
    @so = So.new
  end

  def create
    @so = So.new(so_params)
    if @so.save
      redirect_to "/sos/#{@so.id}", notice: 'SO created successfully!'
    else
      flash.now[:alert] = @so.errors.values.last.last
      render action: "new"
    end
  end

  private
  def so_params
    params.require(:so).permit(:name, :img)
  end
end