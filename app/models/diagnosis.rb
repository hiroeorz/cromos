# == Schema Information
# Schema version: 20110412151311
#
# Table name: diagnoses
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  yes_id      :integer
#  no_id       :integer
#

class Diagnosis < ActiveRecord::Base
  has_one :yes, :class_name => "Diagnosis", :foreign_key => :yes_id
  has_one :no, :class_name => "Diagnosis", :foreign_key => :no_id

  has_many :diagnoses_parameters, :class_name => "DiagnosesParameters",
           :foreign_key => :diagnosis_id
  has_many :parameters, :through => :diagnoses_parameters, 
           :class_name => "Parameter", :foreign_key => :parameter_id
  
  attr_reader :examine_object
  attr_accessor :counter

  def fqueue
    @fqueue ||= {}
  end

  def counter
    @counter ||= 0
  end

  def call(name)
    name = name.to_sym if name.kind_of?(String)
    fqueue[name].call
  end

  def load_functions
    parameters.each do |p|
      fqueue[p.name.to_sym] = lambda{ eval(p.code) }
    end

    return !parameters.empty?
  end

end
