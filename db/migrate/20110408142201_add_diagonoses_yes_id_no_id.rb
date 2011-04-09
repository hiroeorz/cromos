class AddDiagonosesYesIdNoId < ActiveRecord::Migration
  def self.up
    add_column :diagnoses, :yes_id, :integer
    add_column :diagnoses, :no_id, :integer
  end

  def self.down
    drop_column :diagnoses, :yes_id
    drop_column :diagnoses, :no_id
  end
end
