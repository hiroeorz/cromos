class CreateDiagnosesParameters < ActiveRecord::Migration
  def self.up
    create_table :diagnoses_parameters do |t|
      t.integer :diagnosis_id
      t.integer :parameter_id
      t.string :args
      t.boolean :return_value
      t.timestamps
    end
  end

  def self.down
    drop_table :diagnoses_parameters
  end
end
