class AddImgToSos < ActiveRecord::Migration
  def change
    add_column :sos, :img, :string
  end
end
