module PostsHelper
  # This method returns true or false based on if the post belongs to the user or not
  def is_my_post?(post)
    if user_signed_in? == true
      @post_author_check = Post.where('id = ? AND user_id = ?', post.id, current_user.id).any? ? true : false
    else
      @post_author_check = false
    end
  end
  # This method returns true or false based on if the comment belongs to the user or not
  def is_my_comment?(comment)
    if user_signed_in? == true
      @comment_author_check = Comment.where('id = ? AND user_id = ?', comment.id, current_user.id).any? ? true : false
    else
      @comment_author_check = false
    end
  end
end
