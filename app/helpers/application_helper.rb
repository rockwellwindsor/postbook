module ApplicationHelper
  # redirect if no user is detected and flash a message
  def is_signed_in?
    unless user_signed_in? 
      redirect_to new_user_session_path, notice: "Please sign in to your account first."
    end
  end
end
