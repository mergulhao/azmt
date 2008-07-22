require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClassesController do
  describe "route generation" do

    it "should map { :controller => 'classes', :action => 'index' } to /classes" do
      route_for(:controller => "classes", :action => "index").should == "/classes"
    end
  
    it "should map { :controller => 'classes', :action => 'new' } to /classes/new" do
      route_for(:controller => "classes", :action => "new").should == "/classes/new"
    end
  
    it "should map { :controller => 'classes', :action => 'show', :id => 1 } to /classes/1" do
      route_for(:controller => "classes", :action => "show", :id => 1).should == "/classes/1"
    end
  
    it "should map { :controller => 'classes', :action => 'edit', :id => 1 } to /classes/1/edit" do
      route_for(:controller => "classes", :action => "edit", :id => 1).should == "/classes/1/edit"
    end
  
    it "should map { :controller => 'classes', :action => 'update', :id => 1} to /classes/1" do
      route_for(:controller => "classes", :action => "update", :id => 1).should == "/classes/1"
    end
  
    it "should map { :controller => 'classes', :action => 'destroy', :id => 1} to /classes/1" do
      route_for(:controller => "classes", :action => "destroy", :id => 1).should == "/classes/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'classes', action => 'index' } from GET /classes" do
      params_from(:get, "/classes").should == {:controller => "classes", :action => "index"}
    end
  
    it "should generate params { :controller => 'classes', action => 'new' } from GET /classes/new" do
      params_from(:get, "/classes/new").should == {:controller => "classes", :action => "new"}
    end
  
    it "should generate params { :controller => 'classes', action => 'create' } from POST /classes" do
      params_from(:post, "/classes").should == {:controller => "classes", :action => "create"}
    end
  
    it "should generate params { :controller => 'classes', action => 'show', id => '1' } from GET /classes/1" do
      params_from(:get, "/classes/1").should == {:controller => "classes", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'classes', action => 'edit', id => '1' } from GET /classes/1;edit" do
      params_from(:get, "/classes/1/edit").should == {:controller => "classes", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'classes', action => 'update', id => '1' } from PUT /classes/1" do
      params_from(:put, "/classes/1").should == {:controller => "classes", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'classes', action => 'destroy', id => '1' } from DELETE /classes/1" do
      params_from(:delete, "/classes/1").should == {:controller => "classes", :action => "destroy", :id => "1"}
    end
  end
end
