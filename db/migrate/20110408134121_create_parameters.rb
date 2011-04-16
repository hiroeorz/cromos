class CreateParameters < ActiveRecord::Migration
  def self.up
    create_table :parameters do |t|
      t.string :name
      t.text :description
      t.text :function_name
      t.text :code
      t.text :type
      t.timestamps
    end

    add_index :parameters, :function_name, :unique => true
    add_index :parameters, :name, :unique => true
  end

  def self.down
    drop_table :parameters
  end
end
