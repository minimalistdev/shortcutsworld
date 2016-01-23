class SosController < ApplicationController
  def create
    @so = So.new(so_params)
    redirect_to :root, notice: 'SO created successfully!'
  end

  private
  def so_params
    params.require(:so).permit(:name, :img)
  end
end