class SosController < ApplicationController
  def create
    @so = So.new(so_params)
    if @so.save
      redirect_to :root, notice: 'SO created successfully!'
    else
      redirect_to :root, alert: 'Error on create SO!'
    end

  end

  private
  def so_params
    params.require(:so).permit(:name, :img)
  end
end