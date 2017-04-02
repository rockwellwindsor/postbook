require 'rails_helper'

RSpec.describe "Posts", type: :request do
  def log_in_as(user)
    visit new_user_session_path
    fill_in("Email", :with => user.email)
    fill_in("Password", :with => user.password)
    click_button("Log in")
  end
  describe "GET /posts" do
    it "show all the posts as the root path" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /post/:id" do
    it "show the post" do
      post = FactoryGirl.create(:post)
      get post_path(post)
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /post/new" do
    it "show the new post form" do
      user = FactoryGirl.create(:user)
      user.confirmed_at = Time.now
      user.save
      log_in_as(user)
      visit new_post_path
      expect(response).to have_http_status(200)
    end
  end
end
