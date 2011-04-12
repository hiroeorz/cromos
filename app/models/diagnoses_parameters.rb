# == Schema Information
# Schema version: 20110412151311
#
# Table name: diagnoses_parameters
#
#  id           :integer         not null, primary key
#  diagnosis_id :integer
#  parameter_id :integer
#  args         :string(255)
#  return_value :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class DiagnosesParameters < ActiveRecord::Base
  belongs_to :diagnoses, :foreign_key => :diagnosis_id
  belongs_to :parameters, :foreign_key => :parameter_id
end
