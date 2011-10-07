module Rostra
  class Engine < Rails::Engine
    require 'acts-as-taggable-on'
    require 'cancan'

    isolate_namespace Rostra
  end
end
