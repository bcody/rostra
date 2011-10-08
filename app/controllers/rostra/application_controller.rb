module Rostra
  class ApplicationController < ActionController::Base

    helper_method :user_logged_in?

    rescue_from CanCan::AccessDenied do |exception|
      after_access_denied
    end

    # Check if a user is logged in
    #
    def user_signed_in?
      current_user
    end

    private

    # Override <tt>cancan</tt>'s default class of <tt>Ability</tt> to user <tt>Rostra::Ability</tt>.
    #
    def current_ability
      @current_ability ||= Rostra::Ability.new(current_user)
    end

    # Override this method to if finer control over what happens when <tt>cancan</tt> denies access.
    #
    def after_access_denied
      redirect_to root_url, alert: "You don't have access to view this page"
    end

  end
end
