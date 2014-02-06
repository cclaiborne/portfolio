class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    attr_accessor :user, :post
    def resolve
        scope
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
end
