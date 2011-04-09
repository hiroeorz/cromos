class AddParametersLimitValue < ActiveRecord::Migration
  def self.up
    add_column :parameters, :limit_value, :integer
  end

  def self.down
    drop_column :parameters, :limit_value
  end
end
