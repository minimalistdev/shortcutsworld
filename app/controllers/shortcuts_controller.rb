class ShortcutsController < ApplicationController

  def index
    @app = App.find_by_id(params[:id])

    if @app.nil?
      render :nothing => true
    elsif
      @shortcuts = @app.shortcuts

      respond_to do |format|
        format.json { render json: @shortcuts.to_json}
      end
    end
  end

  def new
    @app = App.find_by_id(params[:app_id])
    @shortcut = @app.shortcuts.build
  end

  def create
    @app = App.find_by_id(params[:app_id])
    @shortcut = @app.shortcuts.build(app_params)

    if @shortcut.save
      redirect_to "/sos/#{@so.id}/apps/#{@app.id}/shortcuts/#{@shortcut.id}", notice: 'Shortcut created successfully!'
    else
      redirect_to :root, alert: 'Error on create Shortcut!'
    end

  end

  private
  def app_params
    params.require(:shortcut).permit(:name, :description)
  end
end