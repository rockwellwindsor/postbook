module ApplicationHelper
  # redirect if no user is detected
  def is_signed_in?
    unless user_signed_in? 
      redirect_to new_user_session_path, notice: "Please sign in first."
    end
  end
end
