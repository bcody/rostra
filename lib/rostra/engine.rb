module Rostra
  class Engine < Rails::Engine
    require 'acts-as-taggable-on'
    require 'cancan'
    require 'simple_form'
    require 'jquery-rails'
    require 'client_side_validations'

    isolate_namespace Rostra
  end
end
