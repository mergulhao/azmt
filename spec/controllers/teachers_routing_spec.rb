require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TeachersController do
  describe "route generation" do

    it "should map { :controller => 'teachers', :action => 'index' } to /teachers" do
      route_for(:controller => "teachers", :action => "index").should == "/teachers"
    end
  
    it "should map { :controller => 'teachers', :action => 'new' } to /teachers/new" do
      route_for(:controller => "teachers", :action => "new").should == "/teachers/new"
    end
  
    it "should map { :controller => 'teachers', :action => 'show', :id => 1 } to /teachers/1" do
      route_for(:controller => "teachers", :action => "show", :id => 1).should == "/teachers/1"
    end
  
    it "should map { :controller => 'teachers', :action => 'edit', :id => 1 } to /teachers/1/edit" do
      route_for(:controller => "teachers", :action => "edit", :id => 1).should == "/teachers/1/edit"
    end
  
    it "should map { :controller => 'teachers', :action => 'update', :id => 1} to /teachers/1" do
      route_for(:controller => "teachers", :action => "update", :id => 1).should == "/teachers/1"
    end
  
    it "should map { :controller => 'teachers', :action => 'destroy', :id => 1} to /teachers/1" do
      route_for(:controller => "teachers", :action => "destroy", :id => 1).should == "/teachers/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'teachers', action => 'index' } from GET /teachers" do
      params_from(:get, "/teachers").should == {:controller => "teachers", :action => "index"}
    end
  
    it "should generate params { :controller => 'teachers', action => 'new' } from GET /teachers/new" do
      params_from(:get, "/teachers/new").should == {:controller => "teachers", :action => "new"}
    end
  
    it "should generate params { :controller => 'teachers', action => 'create' } from POST /teachers" do
      params_from(:post, "/teachers").should == {:controller => "teachers", :action => "create"}
    end
  
    it "should generate params { :controller => 'teachers', action => 'show', id => '1' } from GET /teachers/1" do
      params_from(:get, "/teachers/1").should == {:controller => "teachers", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'teachers', action => 'edit', id => '1' } from GET /teachers/1;edit" do
      params_from(:get, "/teachers/1/edit").should == {:controller => "teachers", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'teachers', action => 'update', id => '1' } from PUT /teachers/1" do
      params_from(:put, "/teachers/1").should == {:controller => "teachers", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'teachers', action => 'destroy', id => '1' } from DELETE /teachers/1" do
      params_from(:delete, "/teachers/1").should == {:controller => "teachers", :action => "destroy", :id => "1"}
    end
  end
end
