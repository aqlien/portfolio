class CommentsController < ApplicationController
  before_action :find_post
  skip_before_action :verify_authenticity_token, only: :update

  def index
    @comments = policy_scope(Comment)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Your comment is pending approval.'
      @post.comments << @comment
    else
      redirect_to @post, notice: 'There was a problem saving your comment.'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(:approved=>params[:approved])
      redirect_to @post, notice: 'Comment has been approved.'
    else
      redirect_to @post, notice: 'There was a problem updating this comment.'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :content, :author, :author_id,
      :author_email, :user_agent, :user_ip, :referrer,
      (:approved if PostPolicy.new(current_user, @post).publish?))
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
