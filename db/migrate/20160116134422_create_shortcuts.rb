class CreateShortcuts < ActiveRecord::Migration
  def change
    create_table :shortcuts do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
