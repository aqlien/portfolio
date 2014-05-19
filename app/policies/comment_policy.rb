class CommentPolicy
  attr_reader :user, :comment
  def initialize(user, comment)
    @comment = Comment.new() if comment.nil?
    @user = User.new() if user.nil?
    @user = user
    @comment = comment
  end

  class Scope
    def initialize(user, scope)
      @user = User.new() if user.nil?
      @user = user
      @scope = scope
    end

    def resolve
      if @user.present? && @user.editor?
        @scope.where(approved: false)
      else
        @scope.where(approved: true)
      end
    end
  end
end


