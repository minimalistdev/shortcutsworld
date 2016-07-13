class AddPathwayToShortcuts < ActiveRecord::Migration
  def change
    add_column :shortcuts, :pathway, :text
  end
end
