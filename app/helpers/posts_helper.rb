module PostsHelper
  # This method returns true or false based on if the post belongs to the user or not
  def is_my_post?(post, user)
    @post_author_check = Post.where('id = ? AND user_id = ?', post.id, user.id).any? ? true : false
  end
  # This method returns true or false based on if the comment belongs to the user or not
  def is_my_comment?(comment, user)
    @comment_author_check = Comment.where('id = ? AND user_id = ?', comment.id, user.id).any? ? true : false
  end
end
