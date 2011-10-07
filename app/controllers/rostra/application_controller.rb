module Rostra
  class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
      after_access_denied
    end

    private

    def current_ability
      @current_ability ||= Rostra::Ability.new(current_user)
    end

    def after_access_denied
      redirect_to root_url, alert: "You don't have access to view this page"
    end

  end
end
