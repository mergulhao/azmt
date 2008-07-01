require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClassroomsController do
  describe "route generation" do

    it "should map { :controller => 'classrooms', :action => 'index' } to /classrooms" do
      route_for(:controller => "classrooms", :action => "index").should == "/classrooms"
    end
  
    it "should map { :controller => 'classrooms', :action => 'new' } to /classrooms/new" do
      route_for(:controller => "classrooms", :action => "new").should == "/classrooms/new"
    end
  
    it "should map { :controller => 'classrooms', :action => 'show', :id => 1 } to /classrooms/1" do
      route_for(:controller => "classrooms", :action => "show", :id => 1).should == "/classrooms/1"
    end
  
    it "should map { :controller => 'classrooms', :action => 'edit', :id => 1 } to /classrooms/1/edit" do
      route_for(:controller => "classrooms", :action => "edit", :id => 1).should == "/classrooms/1/edit"
    end
  
    it "should map { :controller => 'classrooms', :action => 'update', :id => 1} to /classrooms/1" do
      route_for(:controller => "classrooms", :action => "update", :id => 1).should == "/classrooms/1"
    end
  
    it "should map { :controller => 'classrooms', :action => 'destroy', :id => 1} to /classrooms/1" do
      route_for(:controller => "classrooms", :action => "destroy", :id => 1).should == "/classrooms/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'classrooms', action => 'index' } from GET /classrooms" do
      params_from(:get, "/classrooms").should == {:controller => "classrooms", :action => "index"}
    end
  
    it "should generate params { :controller => 'classrooms', action => 'new' } from GET /classrooms/new" do
      params_from(:get, "/classrooms/new").should == {:controller => "classrooms", :action => "new"}
    end
  
    it "should generate params { :controller => 'classrooms', action => 'create' } from POST /classrooms" do
      params_from(:post, "/classrooms").should == {:controller => "classrooms", :action => "create"}
    end
  
    it "should generate params { :controller => 'classrooms', action => 'show', id => '1' } from GET /classrooms/1" do
      params_from(:get, "/classrooms/1").should == {:controller => "classrooms", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'classrooms', action => 'edit', id => '1' } from GET /classrooms/1;edit" do
      params_from(:get, "/classrooms/1/edit").should == {:controller => "classrooms", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'classrooms', action => 'update', id => '1' } from PUT /classrooms/1" do
      params_from(:put, "/classrooms/1").should == {:controller => "classrooms", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'classrooms', action => 'destroy', id => '1' } from DELETE /classrooms/1" do
      params_from(:delete, "/classrooms/1").should == {:controller => "classrooms", :action => "destroy", :id => "1"}
    end
  end
end
