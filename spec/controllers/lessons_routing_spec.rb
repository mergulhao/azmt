require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LessonsController do
  describe "route generation" do

    it "should map { :controller => 'lessons', :action => 'index' } to /lessons" do
      route_for(:controller => "lessons", :action => "index").should == "/lessons"
    end
  
    it "should map { :controller => 'lessons', :action => 'new' } to /lessons/new" do
      route_for(:controller => "lessons", :action => "new").should == "/lessons/new"
    end
  
    it "should map { :controller => 'lessons', :action => 'show', :id => 1 } to /lessons/1" do
      route_for(:controller => "lessons", :action => "show", :id => 1).should == "/lessons/1"
    end
  
    it "should map { :controller => 'lessons', :action => 'edit', :id => 1 } to /lessons/1/edit" do
      route_for(:controller => "lessons", :action => "edit", :id => 1).should == "/lessons/1/edit"
    end
  
    it "should map { :controller => 'lessons', :action => 'update', :id => 1} to /lessons/1" do
      route_for(:controller => "lessons", :action => "update", :id => 1).should == "/lessons/1"
    end
  
    it "should map { :controller => 'lessons', :action => 'destroy', :id => 1} to /lessons/1" do
      route_for(:controller => "lessons", :action => "destroy", :id => 1).should == "/lessons/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'lessons', action => 'index' } from GET /lessons" do
      params_from(:get, "/lessons").should == {:controller => "lessons", :action => "index"}
    end
  
    it "should generate params { :controller => 'lessons', action => 'new' } from GET /lessons/new" do
      params_from(:get, "/lessons/new").should == {:controller => "lessons", :action => "new"}
    end
  
    it "should generate params { :controller => 'lessons', action => 'create' } from POST /lessons" do
      params_from(:post, "/lessons").should == {:controller => "lessons", :action => "create"}
    end
  
    it "should generate params { :controller => 'lessons', action => 'show', id => '1' } from GET /lessons/1" do
      params_from(:get, "/lessons/1").should == {:controller => "lessons", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'lessons', action => 'edit', id => '1' } from GET /lessons/1;edit" do
      params_from(:get, "/lessons/1/edit").should == {:controller => "lessons", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'lessons', action => 'update', id => '1' } from PUT /lessons/1" do
      params_from(:put, "/lessons/1").should == {:controller => "lessons", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'lessons', action => 'destroy', id => '1' } from DELETE /lessons/1" do
      params_from(:delete, "/lessons/1").should == {:controller => "lessons", :action => "destroy", :id => "1"}
    end
  end
end
