class DiagnosesSetups < ActiveRecord::Base
  belongs_to :diagnoses, :foreign_key => :diagnosis_id
  belongs_to :setups, :foreign_key => :setup_id
end
