require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DisciplinesController do
  describe "route generation" do

    it "should map { :controller => 'disciplines', :action => 'index' } to /disciplines" do
      route_for(:controller => "disciplines", :action => "index").should == "/disciplines"
    end
  
    it "should map { :controller => 'disciplines', :action => 'new' } to /disciplines/new" do
      route_for(:controller => "disciplines", :action => "new").should == "/disciplines/new"
    end
  
    it "should map { :controller => 'disciplines', :action => 'show', :id => 1 } to /disciplines/1" do
      route_for(:controller => "disciplines", :action => "show", :id => 1).should == "/disciplines/1"
    end
  
    it "should map { :controller => 'disciplines', :action => 'edit', :id => 1 } to /disciplines/1/edit" do
      route_for(:controller => "disciplines", :action => "edit", :id => 1).should == "/disciplines/1/edit"
    end
  
    it "should map { :controller => 'disciplines', :action => 'update', :id => 1} to /disciplines/1" do
      route_for(:controller => "disciplines", :action => "update", :id => 1).should == "/disciplines/1"
    end
  
    it "should map { :controller => 'disciplines', :action => 'destroy', :id => 1} to /disciplines/1" do
      route_for(:controller => "disciplines", :action => "destroy", :id => 1).should == "/disciplines/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'disciplines', action => 'index' } from GET /disciplines" do
      params_from(:get, "/disciplines").should == {:controller => "disciplines", :action => "index"}
    end
  
    it "should generate params { :controller => 'disciplines', action => 'new' } from GET /disciplines/new" do
      params_from(:get, "/disciplines/new").should == {:controller => "disciplines", :action => "new"}
    end
  
    it "should generate params { :controller => 'disciplines', action => 'create' } from POST /disciplines" do
      params_from(:post, "/disciplines").should == {:controller => "disciplines", :action => "create"}
    end
  
    it "should generate params { :controller => 'disciplines', action => 'show', id => '1' } from GET /disciplines/1" do
      params_from(:get, "/disciplines/1").should == {:controller => "disciplines", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'disciplines', action => 'edit', id => '1' } from GET /disciplines/1;edit" do
      params_from(:get, "/disciplines/1/edit").should == {:controller => "disciplines", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'disciplines', action => 'update', id => '1' } from PUT /disciplines/1" do
      params_from(:put, "/disciplines/1").should == {:controller => "disciplines", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'disciplines', action => 'destroy', id => '1' } from DELETE /disciplines/1" do
      params_from(:delete, "/disciplines/1").should == {:controller => "disciplines", :action => "destroy", :id => "1"}
    end
  end
end
