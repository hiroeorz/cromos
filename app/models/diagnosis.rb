class Diagnosis < ActiveRecord::Base
  has_many :parameters
  has_one :yes, :class_name => "Diagnosis", :foreign_key => :yes_id
  has_one :no, :class_name => "Diagnosis", :foreign_key => :no_id
  
end
