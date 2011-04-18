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
  SAFE_LEVEL = 3

  has_one :yes, :class_name => "Diagnosis", :foreign_key => :yes_id
  has_one :no, :class_name => "Diagnosis", :foreign_key => :no_id

  has_many :diagnoses_parameters, :class_name => "DiagnosesParameters",
           :foreign_key => :diagnosis_id
  has_many :parameters, :through => :diagnoses_parameters, 
           :class_name => "Parameter", :foreign_key => :parameter_id

  has_many :diagnoses_setups, :class_name => "DiagnosesSetups",
           :foreign_key => :diagnosis_id
  has_many :setups, :through => :diagnoses_setups, 
           :class_name => "Setup", :foreign_key => :setup_id
  
  
  attr_reader :examine_object
  attr_accessor :counter

  def fqueue
    @fqueue ||= {}
  end

  def setup_queue
    @setup_queue ||= []
  end

  def function_count
    fqueue.count
  end

  def counter
    @counter ||= 0
  end

  def call(name)
    if setups.size > 0 and setup_queue.empty?
      load_setups
    end

    if parameters.size > 0 and fqueue.empty?
      load_functions
    end

    name = name.to_sym if name.kind_of?(String)
    return nil unless fqueue.has_key?(name)

    clean_room = CleanRoom.new
    clean_room.setup(setup_queue)
    clean_room.exec(fqueue[name])
  end

  def load_setups
    setups.each do |s|
      setup_queue << lambda{ $SAFE = SAFE_LEVEL; eval(s.code) }
    end

    return !setup_queue.empty?
  end

  def load_functions
    parameters.each do |p|
      fqueue[p.function_name.to_sym] = 
        lambda{ $SAFE = SAFE_LEVEL; eval(p.code) }
    end

    return !fqueue.empty?
  end

end
