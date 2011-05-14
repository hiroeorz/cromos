class CreateDiagnosesSetups < ActiveRecord::Migration
  def self.up
    create_table :diagnoses_setups do |t|
      t.integer :diagnosis_id
      t.integer :setup_id
      t.timestamps
    end
  end

  def self.down
    drop_table :diagnoses_setups
  end
end
