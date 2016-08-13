class AddShortcutToShortcuts < ActiveRecord::Migration
  def change
    add_column :shortcuts, :shortcut, :text
  end
end
