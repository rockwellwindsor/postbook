require "rails_helper"

describe "authentication process" do

  def log_in_as(user)
    visit new_user_session_path
    fill_in("Email", :with => user.email)
    fill_in("Password", :with => user.password)
    click_button("Log in")
  end

  describe "posts authentication" do
    # ROCKWELL_SUBMISSION_TEST
    it "allows a user who is not logged in to view index page" do
      visit(root_path)
      expect(current_path).to eq(root_path)
    end
    # ROCKWELL_SUBMISSION_TEST
    it "allows a user who is not logged in to view show page" do
      post = FactoryGirl.create(:post)
      post.save
      visit("/posts/#{post.id}")
      expect(current_path).to eq("/posts/#{post.id}")
    end
    # ROCKWELL_SUBMISSION_TEST
    it "redirects a user who is not logged in when trying to view post/new" do
      visit(new_post_path)
      expect(current_path).to eq(new_user_session_path)
    end
    # ROCKWELL_SUBMISSION_TEST
    it "allows a logged in user to view the post create page" do
      user = FactoryGirl.create(:user)
      user.confirmed_at = Time.now
      user.save
      log_in_as(user)
      visit(new_post_path)
      expect(current_path).to eq(new_post_path)
    end
  end
end