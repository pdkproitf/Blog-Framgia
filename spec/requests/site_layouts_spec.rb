require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
  describe "Test layout root path" do
    before  {get root_path}
    it "render to home" do
      assert_template 'home'
    end

    it "total link root_path" do
      assert_select "a[href=?]", root_path, count: 2
    end

    it "full_title" do
      assert_select "title", full_title("")
    end
  end

  describe  "Test layout about path" do
    before  {get about_path}
    it "render to about" do
      expect(response).to render_template('about')
    end

    it "total link root_path" do
      assert_select "a[href=?]", about_path, count: 1
    end

    it "full_title" do
      assert_select "title", full_title('About')
    end
  end

  describe  "Test layout help path" do
    before  {get help_path}
    it "render to help" do
      expect(response).to render_template('help')
    end

    it "total link root_path" do
      assert_select "a[href=?]", about_path, count: 1
    end

    it "full_title" do
      assert_select "title", full_title('Help')
    end
  end

  describe  "Test layout contact path" do
    before  {get contact_path}
    it "render to contact" do
      expect(response).to render_template('contact')
    end

    it "total link root_path" do
      assert_select "a[href=?]", about_path, count: 1
    end

    it "full_title" do
      assert_select "title", full_title('Contact')
    end
  end
end
