class AddSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :sample_type
      t.integer :held
      t.integer :maxheld
      t.integer :barrier
      t.integer :limit
      t.integer :failcnt
      t.timestamps
    end
  end
end
