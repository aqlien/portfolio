class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = User.new()
    @user = user if !user.nil?
    @post = post
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
  end

  def new?
    create?
  end

  def create?
    @user.editor? || @user.author?
  end

  def edit?
    update?
  end

  def publish?
    @user.editor?
  end

  def update?
    @user.editor? || (@user.author? && @user.id == @post.author_id)
  end

  def destroy?
    update?
  end
end
