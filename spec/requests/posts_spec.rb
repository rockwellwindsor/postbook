require 'rails_helper'

RSpec.describe "Posts", type: :request do
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
end
