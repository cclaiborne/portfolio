class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post


  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.nil?
        scope.where(published: true)
      elsif user.editor?
        scope.all
      elsif user.author?
        scope.where(author: user)
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

  def permitted_attributes
    if @user.editor?
      [:title, :body, :published]
    else
      [:title, :body]
    end
  end
end
