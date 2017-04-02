require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /comments" do
    # This redirect either happens because user is not logged in, 
    # or, if they are logged in, because I redirect from the index action
    # because I do not want this page viewable unless there is a use for that.
    # ROCKWELL_SUBMISSION_TEST
    it "does not show comments index page if someone tries to view it" do
      get comments_path
      expect(response).to have_http_status(302)
    end
    # ROCKWELL_SUBMISSION_TEST
    it "does not show comment show page if someone tries to view it" do
      comment = FactoryGirl.create(:comment)
      get comment_path(comment)
      expect(response).to have_http_status(302)
    end
  end
end
