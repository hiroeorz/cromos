class CreateDiagnoses < ActiveRecord::Migration
  def self.up
    create_table :diagnoses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :diagnoses
  end
end
