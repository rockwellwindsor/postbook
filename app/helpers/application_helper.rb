module ApplicationHelper
  # Make sure the user can only edit, update, destroy thier own posts
  def is_post_author?
    @post = current_user.posts.find_by_id(params[:id])
    unless @post != nil
      redirect_to root_path
    end
  end
  # Make sure the user can only edit, update, destroy thier own comments
  def is_comment_author?
    @comment = current_user.comments.find_by_id(params[:id])
    unless @comment != nil
      redirect_to root_path
    end
  end
end