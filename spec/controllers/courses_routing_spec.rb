require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CoursesController do
  describe "route generation" do

    it "should map { :controller => 'courses', :action => 'index' } to /courses" do
      route_for(:controller => "courses", :action => "index").should == "/courses"
    end
  
    it "should map { :controller => 'courses', :action => 'new' } to /courses/new" do
      route_for(:controller => "courses", :action => "new").should == "/courses/new"
    end
  
    it "should map { :controller => 'courses', :action => 'show', :id => 1 } to /courses/1" do
      route_for(:controller => "courses", :action => "show", :id => 1).should == "/courses/1"
    end
  
    it "should map { :controller => 'courses', :action => 'edit', :id => 1 } to /courses/1/edit" do
      route_for(:controller => "courses", :action => "edit", :id => 1).should == "/courses/1/edit"
    end
  
    it "should map { :controller => 'courses', :action => 'update', :id => 1} to /courses/1" do
      route_for(:controller => "courses", :action => "update", :id => 1).should == "/courses/1"
    end
  
    it "should map { :controller => 'courses', :action => 'destroy', :id => 1} to /courses/1" do
      route_for(:controller => "courses", :action => "destroy", :id => 1).should == "/courses/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'courses', action => 'index' } from GET /courses" do
      params_from(:get, "/courses").should == {:controller => "courses", :action => "index"}
    end
  
    it "should generate params { :controller => 'courses', action => 'new' } from GET /courses/new" do
      params_from(:get, "/courses/new").should == {:controller => "courses", :action => "new"}
    end
  
    it "should generate params { :controller => 'courses', action => 'create' } from POST /courses" do
      params_from(:post, "/courses").should == {:controller => "courses", :action => "create"}
    end
  
    it "should generate params { :controller => 'courses', action => 'show', id => '1' } from GET /courses/1" do
      params_from(:get, "/courses/1").should == {:controller => "courses", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'courses', action => 'edit', id => '1' } from GET /courses/1;edit" do
      params_from(:get, "/courses/1/edit").should == {:controller => "courses", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'courses', action => 'update', id => '1' } from PUT /courses/1" do
      params_from(:put, "/courses/1").should == {:controller => "courses", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'courses', action => 'destroy', id => '1' } from DELETE /courses/1" do
      params_from(:delete, "/courses/1").should == {:controller => "courses", :action => "destroy", :id => "1"}
    end
  end
end
