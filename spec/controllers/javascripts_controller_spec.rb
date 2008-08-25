require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe JavascriptsController do

  describe "handling GET /dynamic_teachers" do
    
    def do_get
      get :dynamic_teachers, :format => 'js'
    end

    it "should assigns disciplines" do
      do_get
      assigns(:disciplines).should_not be_nil
    end

    it "should render dynamic_teachers.js" do
      do_get
      response.should render_template('dynamic_teachers')
    end
  end
end

