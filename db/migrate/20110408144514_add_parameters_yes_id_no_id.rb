class AddParametersYesIdNoId < ActiveRecord::Migration
  def self.up
    add_column :parameters, :yes_id, :integer
    add_column :parameters, :no_id, :integer
  end

  def self.down
    drop_column :parameters, :yes_id
    drop_column :parameters, :no_id
  end
end
