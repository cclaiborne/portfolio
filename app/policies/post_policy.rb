class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    attr_accessor :user, :post
    def resolve
      #editor may view all posts
      if user.editor?
        scope
      #visitors may only view published posts
      else
        scope.where(published: true)
      end
    end
  end
  def initialize(user, post)
    @user = user
    @post = post
  end
  def index?
    if @user.nil?
       false
    else
       @user.author? || @user.editor?
    end
  end
  def update?
    @user.author? || @user.editor?
  end

  def destroy?
    @user.editor?
  end

  def publish?
    @user.editor?
  end
end
