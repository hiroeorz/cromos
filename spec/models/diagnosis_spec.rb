# -*- coding: utf-8 -*-

require 'spec_helper'

describe Diagnosis do

  before :each do
    @diagnosis = Diagnosis.create(:name => "潰瘍性大腸炎",
                                  :description => "出血を伴う腸管内の潰瘍。")

    @parameter = Parameter.new(:name => "頭痛",
                               :description => "頭が痛い",
                               :code => "return true")
  end

  after :each do
    @parameter.delete if @parameter
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
    @diagnosis.parameters << @parameter

    updated_diagnosis = Diagnosis.find(@diagnosis.id)
    updated_diagnosis.parameters.length.should == 1
    updated_diagnosis.parameters.first.should == @parameter
  end

end

describe Diagnosis, :with => "parameters" do

  before :each do
    @parameter1 = Parameter.new(:name => "腹痛",
                                :description => "お腹が痛い",
                                :function_name => "ponpon_pain?",
                                :code => "return true")

    @parameter2 = Parameter.new(:name => "下血",
                                :description => "排便に血が混じる",
                                :function_name => "blood_include?",
                                :code => "return false")

    @parameter3 = Parameter.new(:name => "危険なメソッド",
                                :description => "ファイル操作を行います。",
                                :function_name => "iam_danger?",
                                :code => 
                                "File.open(\"/tmp/text\", \"w\"){ |f| 
                                   f.write(\"helo world\") }")


    @diagnosis = Diagnosis.create(:name => "潰瘍性大腸炎",
                                  :description => "出血を伴う腸管内の潰瘍。",
                                  :parameters => [@parameter1, @parameter2,
                                                 @parameter3])
  end

  after :each do
    @parameter1.delete if @parameter1
    @parameter2.delete if @parameter2
    @parameter3.delete if @parameter3
    @diagnosis.delete if @diagnosis
  end

  it "should load function from parameter" do
    @diagnosis.call(@parameter1.function_name).should be_true
    @diagnosis.call(@parameter2.function_name).should be_false

    @diagnosis.instance_eval { @fqueue.length.should == 3 }
    @diagnosis.function_count.should == 3
  end

  it "should not executable File operation" do
    lambda { @diagnosis.call(@parameter3.function_name) }.
      should raise_error(SecurityError)
  end

  it "should have counter" do
    @diagnosis.counter = nil
    @diagnosis.counter.should == 0
    @diagnosis.counter += 1
    @diagnosis.counter.should == 1
    @diagnosis.counter += 2
    @diagnosis.counter.should == 3
  end

  it "should return nil if non exeist function called" do
    @diagnosis.call(:non_exist_function).should be_nil
  end

end
