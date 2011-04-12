class Parameter < ActiveRecord::Base
  has_one :yes, :class_name => "Parameter", :foreign_key => :yes_id
  has_one :no, :class_name => "Parameter", :foreign_key => :no_id

  has_many :diagnoses_parameters, :class_name => "DiagnosesParameters",
           :foreign_key => :diagnosis_id
  has_many :diagnoses, :through => :diagnoses_parameters, 
           :class_name => "Diagnosis"
end
