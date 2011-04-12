class Diagnosis < ActiveRecord::Base
  has_one :yes, :class_name => "Diagnosis", :foreign_key => :yes_id
  has_one :no, :class_name => "Diagnosis", :foreign_key => :no_id

  has_many :diagnoses_parameters, :class_name => "DiagnosesParameters",
           :foreign_key => :parameter_id
  has_many :parameters, :through => :diagnoses_parameters, 
           :class_name => "Parameter", :foreign_key => :parameter_id
  
end
