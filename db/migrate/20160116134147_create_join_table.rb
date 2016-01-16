class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :shortcuts, :keys do |t|
      t.index [:shortcut_id, :key_id]
      t.index [:key_id, :shortcut_id]
    end
  end
end
