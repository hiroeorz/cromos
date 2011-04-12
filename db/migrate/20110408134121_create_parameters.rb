class CreateParameters < ActiveRecord::Migration
  def self.up
    create_table :parameters do |t|
      t.string :name
      t.text :description
      t.text :code
      t.text :type
      t.timestamps
    end
  end

  def self.down
    drop_table :parameters
  end
end
