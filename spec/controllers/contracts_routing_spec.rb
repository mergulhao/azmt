require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContractsController do
  describe "route generation" do

    it "should map { :controller => 'contracts', :action => 'index' } to /contracts" do
      route_for(:controller => "contracts", :action => "index").should == "/contracts"
    end
  
    it "should map { :controller => 'contracts', :action => 'new' } to /contracts/new" do
      route_for(:controller => "contracts", :action => "new").should == "/contracts/new"
    end
  
    it "should map { :controller => 'contracts', :action => 'show', :id => 1 } to /contracts/1" do
      route_for(:controller => "contracts", :action => "show", :id => 1).should == "/contracts/1"
    end
  
    it "should map { :controller => 'contracts', :action => 'edit', :id => 1 } to /contracts/1/edit" do
      route_for(:controller => "contracts", :action => "edit", :id => 1).should == "/contracts/1/edit"
    end
  
    it "should map { :controller => 'contracts', :action => 'update', :id => 1} to /contracts/1" do
      route_for(:controller => "contracts", :action => "update", :id => 1).should == "/contracts/1"
    end
  
    it "should map { :controller => 'contracts', :action => 'destroy', :id => 1} to /contracts/1" do
      route_for(:controller => "contracts", :action => "destroy", :id => 1).should == "/contracts/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'contracts', action => 'index' } from GET /contracts" do
      params_from(:get, "/contracts").should == {:controller => "contracts", :action => "index"}
    end
  
    it "should generate params { :controller => 'contracts', action => 'new' } from GET /contracts/new" do
      params_from(:get, "/contracts/new").should == {:controller => "contracts", :action => "new"}
    end
  
    it "should generate params { :controller => 'contracts', action => 'create' } from POST /contracts" do
      params_from(:post, "/contracts").should == {:controller => "contracts", :action => "create"}
    end
  
    it "should generate params { :controller => 'contracts', action => 'show', id => '1' } from GET /contracts/1" do
      params_from(:get, "/contracts/1").should == {:controller => "contracts", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'contracts', action => 'edit', id => '1' } from GET /contracts/1;edit" do
      params_from(:get, "/contracts/1/edit").should == {:controller => "contracts", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'contracts', action => 'update', id => '1' } from PUT /contracts/1" do
      params_from(:put, "/contracts/1").should == {:controller => "contracts", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'contracts', action => 'destroy', id => '1' } from DELETE /contracts/1" do
      params_from(:delete, "/contracts/1").should == {:controller => "contracts", :action => "destroy", :id => "1"}
    end
  end
end
