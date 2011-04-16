# -*- coding: utf-8 -*-

require 'spec_helper'

describe Diagnosis do

  before :all do
    @diagnosis = Diagnosis.create(:name => "潰瘍性大腸炎",
                                  :description => "出血を伴う腸管内の潰瘍。")
  end

  after :all do
    @diagnosis.delete if @diagnosis
  end

  it "should get fields value" do
    @diagnosis.name.should == "潰瘍性大腸炎"
    @diagnosis.description.should == "出血を伴う腸管内の潰瘍。"
  end

  it "should be updated from update method" do
    new_description = "１日に何度もトイレに行く。"
    @diagnosis.update_attributes(:description => new_description)

    updated_diagnosis = Diagnosis.find(@diagnosis.id)
    updated_diagnosis.name.should == @diagnosis.name
    updated_diagnosis.description.should == new_description
  end

  it "should have parameters" do
    parameter = Parameter.new(:name => "頭痛",
                              :description => "頭が痛い",
                              :code => "return true")
    @diagnosis.parameters << parameter

    updated_diagnosis = Diagnosis.find(@diagnosis.id)
    updated_diagnosis.parameters.length.should == 1
    updated_diagnosis.parameters.first.should == parameter
  end

end
