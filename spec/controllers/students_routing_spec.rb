require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StudentsController do
  describe "route generation" do

    it "should map { :controller => 'students', :action => 'index' } to /students" do
      route_for(:controller => "students", :action => "index").should == "/students"
    end
  
    it "should map { :controller => 'students', :action => 'new' } to /students/new" do
      route_for(:controller => "students", :action => "new").should == "/students/new"
    end
  
    it "should map { :controller => 'students', :action => 'show', :id => 1 } to /students/1" do
      route_for(:controller => "students", :action => "show", :id => 1).should == "/students/1"
    end
  
    it "should map { :controller => 'students', :action => 'edit', :id => 1 } to /students/1/edit" do
      route_for(:controller => "students", :action => "edit", :id => 1).should == "/students/1/edit"
    end
  
    it "should map { :controller => 'students', :action => 'update', :id => 1} to /students/1" do
      route_for(:controller => "students", :action => "update", :id => 1).should == "/students/1"
    end
  
    it "should map { :controller => 'students', :action => 'destroy', :id => 1} to /students/1" do
      route_for(:controller => "students", :action => "destroy", :id => 1).should == "/students/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'students', action => 'index' } from GET /students" do
      params_from(:get, "/students").should == {:controller => "students", :action => "index"}
    end
  
    it "should generate params { :controller => 'students', action => 'new' } from GET /students/new" do
      params_from(:get, "/students/new").should == {:controller => "students", :action => "new"}
    end
  
    it "should generate params { :controller => 'students', action => 'create' } from POST /students" do
      params_from(:post, "/students").should == {:controller => "students", :action => "create"}
    end
  
    it "should generate params { :controller => 'students', action => 'show', id => '1' } from GET /students/1" do
      params_from(:get, "/students/1").should == {:controller => "students", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'students', action => 'edit', id => '1' } from GET /students/1;edit" do
      params_from(:get, "/students/1/edit").should == {:controller => "students", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'students', action => 'update', id => '1' } from PUT /students/1" do
      params_from(:put, "/students/1").should == {:controller => "students", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'students', action => 'destroy', id => '1' } from DELETE /students/1" do
      params_from(:delete, "/students/1").should == {:controller => "students", :action => "destroy", :id => "1"}
    end
  end
end
