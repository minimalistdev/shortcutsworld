class AddAppToShortcuts < ActiveRecord::Migration
  def change
    add_reference :shortcuts, :app, index: true
  end
end
