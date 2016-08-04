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
      redirect_to "/sos/apps/#{@app.id}", notice: 'App created successfully!'
    else
      flash.now[:alert] = @app.errors.values.last.last
      render action: "new"
    end

  end

  private
  def app_params
    params.require(:app).permit(:name, :img)
  end
end