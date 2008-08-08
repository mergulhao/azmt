require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  it "should return title" do
    helper.title.should eql('Default title! Override it!')
  end
  
  it "should return a h3 editing title" do
    helper.should_receive(:_).with("Object").and_return("Object")
    helper.should_receive(:_).with("Editing %s", "Object").and_return("Edit Object Title")
    helper.title_edit(:object).should eql("<h3>Edit Object Title</h3>")
  end

  
  it "should return a h3 new title" do
    helper.should_receive(:_).with("Object").and_return("Object")
    helper.should_receive(:_).with("New %s", "Object").and_return("New Object Title")
    helper.title_new(:object).should eql("<h3>New Object Title</h3>")
  end

  it "should return create button and cancel link to clear box form" do
    button_message = "Create"
    helper.should_receive(:_).with(button_message).and_return(button_message)
    helper.should_receive(:submit_button).with(button_message).and_return("Create button and ")
    helper.should_receive(:link_to_clear_box_form).with().and_return("Clear box form link")
    helper.create_button_and_cancel_link_to_clear_box_form.should eql("Create button and Clear box form link")
  end
  
  it "should return update button and cancel link to clear box form" do
    button_message = "Update"
    helper.should_receive(:_).with(button_message).and_return(button_message)
    helper.should_receive(:submit_button).with(button_message).and_return("Update button and ")
    helper.should_receive(:link_to_clear_box_form).with().and_return("Clear box form link")
    helper.update_button_and_cancel_link_to_clear_box_form.should eql("Update button and Clear box form link")
  end

  it "should return a submit button with label and button class" do
    result = '<label class="x-small lblbutton"><input class="button" name="commit" type="submit" value="Button" /></label>'
    helper.submit_button("Button").should eql(result)
  end
  
  it "should return a link to clear box form" do
    result = '<label class="x-small" style="text-align: right;"><a href="#" onclick="clearBoxForm(); return false;">Cancelar</a></label>'
    helper.link_to_clear_box_form.should eql(result)
  end
  
  it "should return link add to remote" do
    helper.should_receive(:image_tag).with("icons/file_add.png").and_return('Image tag')
    helper.should_receive(:_).with("Add").and_return('Add Message')
    helper.should_receive(:new_object_url).and_return('New Object Url')
    
    helper.should_receive(:link_to_remote).with("Image tag Add Message", {:url=>"New Object Url", :method=>:get, :update=>"box_form"}).and_return('link to remote')
    helper.link_add_to_remote.should eql('link to remote')
  end
  
  it "should return link edit to remote" do
    object = 'object'
    helper.should_receive(:image_tag).with("icons/file_edit.png").and_return('Image tag')
    helper.should_receive(:edit_object_url).with(object).and_return('Edit Object Url')
    
    helper.should_receive(:link_to_remote).with("Image tag", {:method=>:get, :update=>"box_form", :url=>"Edit Object Url"}).and_return('link to remote')
    helper.link_edit_to_remote(object).should eql('link to remote')
  end
  
  it "should return link delete" do
    object = 'object'
    helper.should_receive(:_).with('You will delete it permanently. Are you sure?').and_return('Confirm message')
    helper.should_receive(:image_tag).with("icons/file_delete.png").and_return('Image tag')
    helper.should_receive(:object_url).with(object).and_return('Object Url')
    
    helper.should_receive(:link_to).with("Image tag", "Object Url", {:method=>:delete, :confirm=>"Confirm message"}).and_return('link delete')
    helper.link_delete(object).should eql('link delete')
  end
  
  describe ".error_messages_for" do
    it "should return nothing when no errors" do
      no_errors = Object.new
      no_errors.should_receive(:errors).and_return([])
      helper.instance_variable_set(:@no_errors, no_errors)
      helper.error_messages_for(:no_errors).should eql('')
    end
    
    it "should return the errors template" do
      with_errors = Lesson.new
      with_errors.should_not be_valid
      helper.instance_variable_set(:@with_errors, with_errors)
      helper.error_messages_for(:with_errors).should_not be_empty
    end
  end
  
  describe ".flash_notice" do
    it "should return nothing if flash[:notice] is blank" do
      helper.should_receive(:flash).and_return({})
      helper.flash_notice.should be_nil
    end
    
    it "should return a p element with content of flash[:notice]" do
      helper.should_receive(:flash).twice.and_return({:notice => "My notice"})
      helper.flash_notice.should eql("<p class=\"infoExplanation\">My notice</p>")
    end
  end
end
