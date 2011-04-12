class DiagnosesParameters < ActiveRecord::Base
  belongs_to :diagnoses, :foreign_key => :diagnosis_id
  belongs_to :parameters, :foreign_key => :parameter_id
end
