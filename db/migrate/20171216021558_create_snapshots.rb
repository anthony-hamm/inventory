class CreateSnapshots < ActiveRecord::Migration[5.0]
  def change
    create_table :snapshots do |t|
      t.belongs_to  :store
      t.json        :items
      t.integer     :total_loss,    default: 0
      t.integer     :total_excess,  default: 0
      t.timestamps
    end
  end
end
