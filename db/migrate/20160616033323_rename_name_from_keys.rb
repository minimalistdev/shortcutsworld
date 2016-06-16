class RenameNameFromKeys < ActiveRecord::Migration
  def change
    rename_column :keys, :name, :char
  end
end
