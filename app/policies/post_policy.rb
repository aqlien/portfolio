class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = User.new()
    @user = user if !user.nil?
    @post = post
  end

  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = User.new()
      @user = user if !user.nil?
      @scope = scope
    end

    def resolve
      if @user.editor?
        @scope.all
      else
        @scope.where(published: true)
      end
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
