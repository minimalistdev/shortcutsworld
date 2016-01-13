class CreateSos < ActiveRecord::Migration
  def change
    create_table :sos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
