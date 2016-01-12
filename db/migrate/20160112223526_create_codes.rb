class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :char

      t.timestamps null: false
    end
  end
end
