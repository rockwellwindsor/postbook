require "rails_helper"
require 'spec_helper'

describe "adding a comment" do

  def log_in_as(user)
    visit new_user_session_path
    fill_in("Email", :with => user.email)
    fill_in("Password", :with => user.password)
    click_button("Log in")
  end

  # ROCKWELL_SUBMISSION_TEST
  it "does not show the add comment button to a user who is not logged in" do
    post = FactoryGirl.create(:post)
    visit(post_path(post))
    expect(current_path).to eq(post_path(post))
    expect(page).to_not have_css('.go-to-comment-div')
  end
  # ROCKWELL_SUBMISSION_TEST
  it "does show the leave comment button to a user who is logged in" do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    user.save
    log_in_as(user)
    visit(post_path(post))
    expect(page).to have_css(".add-comment-button")
  end
end