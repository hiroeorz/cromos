class Setup < ActiveRecord::Migration
  def self.up
    create_table :setups do |t|
      t.string :name
      t.string :args
      t.string :code
      t.timestamps
    end
  end

  def self.down
    drop_table :setups
  end
end
