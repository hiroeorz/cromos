class Parameter < ActiveRecord::Base
  belongs_to :diagnosises
  has_one :yes, :class_name => "Parameter", :foreign_key => :yes_id
  has_one :no, :class_name => "Parameter", :foreign_key => :no_id
end
