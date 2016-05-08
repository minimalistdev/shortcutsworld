class AppsController < ApplicationController

  def index
    @so = So.find_by_id(params[:id])

    if @so.nil?
      render :nothing => true
    elsif
      @apps = @so.apps

      respond_to do |format|
        format.json { render json: @apps.to_json}
      end
    end
  end

  def new
    @so = So.find_by_id(params[:id])
    @app = @so.apps.build
  end

  def create
    @so = So.find_by_id(params[:id])
    @app = @so.apps.build(app_params)

    if @app.save
      redirect_to "/sos/#{@so.id}/apps/#{@app.id}", notice: 'App created successfully!'
    else
      redirect_to :root, alert: 'Error on create App!'
    end

  end

  private
  def app_params
    params.require(:app).permit(:name, :img)
  end
end