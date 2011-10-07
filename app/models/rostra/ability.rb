module Rostra
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(user)
      @user = user || User.new

      if logged_in?
        can :manage, Question, :user => user
      end

      can :read, :all
    end

    private

    def logged_in?
      ! user.new_record?
    end

  end
end