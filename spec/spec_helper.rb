# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/test/fixtures/'

  config.global_fixtures = :all
  # == Fixtures
  #
  # You can declare fixtures for each example_group like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so right here. Just uncomment the next line and replace the fixture
  # names with your fixtures.
  #
  # config.global_fixtures = :table_a, :table_b
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
  #
  # You can also declare which fixtures to use (for example fixtures for test/fixtures):
  #
  # config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  #
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  #
  # == Notes
  # 
  # For more information take a look at Spec::Example::Configuration and Spec::Runner
end

def should_have_ajaxian_responses_enabled
  model_p = @description_text.underscore.split('_')[0]
  model_s = model_p.singularize
  model_sym = model_s.to_sym
  model_class = model_s.camelize.constantize

  describe "handling XHR GET /#{model_p}/new" do

    before(:each) do
      @record = mock_model(model_class)
      
      if controller.model_name == 'student'
        @record.should_receive(:address_state=).with("Rio de Janeiro")
        @record.should_receive(:address_city=).with("Rio de Janeiro")
      end
      
      model_class.stub!(:new).and_return(@record)
    end
  
    def do_xhr
      xhr :get, :new
    end

    it "should be successful" do
      do_xhr
      response.should be_success
    end
  
    it "should render new template" do
      do_xhr
      response.should render_template('new')
    end
    
    it "should not render layout" do
      controller.expect_render(:layout => false)
      do_xhr
    end
  
    it "should create an new #{model_s}" do
      model_class.should_receive(:new).and_return(@record)
      do_xhr
    end

    it "should not save the new #{model_s}" do
      @record.should_not_receive(:save)
      do_xhr
    end
  
    it "should assign the new #{model_s} for the view" do
      do_xhr
      assigns[model_sym].should equal(@record)
    end
  end
  
  describe "handling XHR GET /#{model_p}/1/edit" do

    before(:each) do
      @record = mock_model(model_class)
      model_class.stub!(:find).and_return(@record)
    end
  
    def do_xhr
      xhr :get, :edit, :id => "1"
    end

    it "should be successful" do
      do_xhr
      response.should be_success
    end
  
    it "should render edit template" do
      do_xhr
      response.should render_template('edit')
    end
    
    it "should not render layout" do
      controller.expect_render(:layout => false)
      do_xhr
    end
  
    it "should find the #{model_s} requested" do
      model_class.should_receive(:find).and_return(@record)
      do_xhr
    end
  
    it "should assign the found #{model_p} for the view" do
      do_xhr
      assigns[model_sym].should equal(@record)
    end
  end

  describe "handling XHR POST /#{model_p}" do

    before(:each) do
      @record = mock_model(model_class, :to_param => "1")
      model_class.stub!(:new).and_return(@record)
    end
    
    describe "with successful save" do
  
      def do_xhr(model)
        @record.should_receive(:save).and_return(true)
        xhr :post, :create, model => {}
      end
  
      it "should create a new #{model_s} and set flash" do
        model_class.should_receive(:new).with({}).and_return(@record)
        do_xhr(model_sym)
        flash[:notice].should eql('Inserido com sucesso!')
      end

      it "should render redirect_to_collection" do
        do_xhr(model_sym)
        response.should render_template('common/redirect_to_collection')
      end

    end
    
    describe "with failed save" do

      def do_xhr
        @record.should_receive(:save).and_return(false)
        xhr :post, :create, :model_class => {}
      end
  
      it "should re-render 'new'" do
        do_xhr
        response.should render_template('new')
      end
      
      it "should not render layout" do
        controller.expect_render(:action => 'new', :layout => false)
        do_xhr
      end
      
    end
  end

  describe "handling XHR PUT /#{model_p}/1" do

    before(:each) do
      @record = mock_model(model_class, :to_param => "1")
      model_class.stub!(:find).and_return(@record)
    end
    
    describe "with successful update" do

      def do_xhr
        @record.should_receive(:update_attributes).and_return(true)
        xhr :put, :update, :id => "1"
      end

      it "should find the #{model_s} requested" do
        model_class.should_receive(:find).with("1").and_return(@record)
        do_xhr
      end

      it "should update the found #{model_s} and set flash" do
        do_xhr
        assigns(model_sym).should equal(@record)
        flash[:notice].should eql('Atualizado com sucesso!')
      end

      it "should redirect to the #{model_s}" do
        do_xhr
        response.should render_template('common/redirect_to_collection')
      end

    end
    
    describe "with failed update" do

      def do_xhr
        @record.should_receive(:update_attributes).and_return(false)
        xhr :put, :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_xhr
        response.should render_template('edit')
      end

      it "should not render layout" do
        controller.expect_render(:action => 'edit', :layout => false)
        do_xhr
      end
      
    end
  end
end