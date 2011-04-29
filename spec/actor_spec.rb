require 'privileged'

describe "User" do
  
  context "with the default privilege (false)" do
    
    before :each do
      
      class User
        extend Privileged::Actor
        privilege :can_view?, :viewable_by?
      end

      class Page
      end
      
      @user = User.new
      @page = Page.new
      
    end
  
    it "should not be able to view the page object" do
      @user.can_view?(@page).should be_false
    end
    
    it "should respond to the can_view? method" do
      @user.respond_to?("can_view?").should be_true
    end
    
  end
  

  context "with a default privilege manually set to true" do
    
    before :each do
      
      class User
        extend Privileged::Actor
        privilege :can_view?, :viewable_by?, :default => true
      end

      class Page
      end
      
      @user = User.new
      @page = Page.new
      
    end
  
    it "should be able to view the page object" do
      @user.can_view?(@page).should be_true
    end
    
  end
  
  
  context "with a default privilege manually set to true, but overriden to false on the Page class" do
    
    before :each do
      
      class User
        extend Privileged::Actor
        privilege :can_view?, :viewable_by?, :default => true
      end

      class Page
        def viewable_by?(user)
          false
        end
      end
      
      @user = User.new
      @page = Page.new
      
    end
  
    it "should not be able to view the page object" do
      @user.can_view?(@page).should be_false
    end
    
  end
  
  
  context "with the default privilege overriden by a method on the Page class" do
    
    before :each do
      
      class User
        extend Privileged::Actor
        privilege :can_view?, :viewable_by?
        attr_accessor :admin
      end

      class Page
        def viewable_by?(user)
          user.admin
        end
      end
      
      @admin = User.new
      @admin.admin = true
      @non_admin = User.new
      @non_admin.admin = false
      @page = Page.new
      
    end
  
    it "should not be able to view the page if not an admin" do
      @non_admin.can_view?(@page).should be_false
    end
    
    it "should be able to view the page if an admin" do
      @admin.can_view?(@page).should be_true
    end
    
  end
  
end