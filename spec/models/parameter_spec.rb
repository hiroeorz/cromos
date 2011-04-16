# -*- coding: utf-8 -*-
require 'spec_helper'

describe Parameter do
  before :all do
    @parameter = Parameter.create(:name => "頭痛",
                                  :description => "頭が痛い",
                                  :function_name => "headache",
                                  :code => "return true")
  end

  after :all do
    @parameter.delete if @parameter
  end

  it "should access to fields value" do
    @parameter.name.should == "頭痛"
    @parameter.description.should == "頭が痛い"
    @parameter.function_name.should == "headache"
    @parameter.code.should == "return true"
  end

  it "should ve uniq function_name" do
    lambda {Parameter.create(:function_name => @parameter.function_name)}.
      should raise_error(ActiveRecord::RecordNotUnique)
  end

  it "should ve uniq name" do
    lambda {Parameter.create(:name => @parameter.name)}.
      should raise_error(ActiveRecord::RecordNotUnique)
  end

end
