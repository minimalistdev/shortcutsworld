class AddSoToKey < ActiveRecord::Migration
  def change
    add_reference :keys, :so, index: true
  end
end
