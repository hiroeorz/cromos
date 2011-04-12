# == Schema Information
# Schema version: 20110412151311
#
# Table name: parameters
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  code        :text
#  type        :text
#  created_at  :datetime
#  updated_at  :datetime
#  yes_id      :integer
#  no_id       :integer
#  limit_value :integer
#

class Parameter < ActiveRecord::Base
  has_one :yes, :class_name => "Parameter", :foreign_key => :yes_id
  has_one :no, :class_name => "Parameter", :foreign_key => :no_id

  has_many :diagnoses_parameters, :class_name => "DiagnosesParameters",
           :foreign_key => :diagnosis_id
  has_many :diagnoses, :through => :diagnoses_parameters, 
           :class_name => "Diagnosis"
end
