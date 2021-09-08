class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :model
      t.string :hashrate
      t.string :power
      t.string :gpu_maker

      t.timestamps
    end
  end
end
