class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def post?
    @user.role == "editor" || @user.role == "author"
  end

  def publish?
    @user.role == "editor"
  end
end
