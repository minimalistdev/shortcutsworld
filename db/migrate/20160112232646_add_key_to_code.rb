class AddKeyToCode < ActiveRecord::Migration
  def change
    add_reference :codes, :key, index: true
  end
end
