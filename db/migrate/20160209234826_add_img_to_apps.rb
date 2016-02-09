class AddImgToApps < ActiveRecord::Migration
  def change
    add_column :apps, :img, :string
  end
end
