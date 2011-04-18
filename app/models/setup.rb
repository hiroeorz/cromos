# == Schema Information
# Schema version: 20110412151311
#
# Table name: setups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  args       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Setup < ActiveRecord::Base
  has_many :diagnoses_setups, :class_name => "DiagnosesSetups",
           :foreign_key => :setup_id
  has_many :diagnoses, :through => :diagnoses_setups, 
           :class_name => "Diagnosis"
end
