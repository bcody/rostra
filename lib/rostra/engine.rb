module Rostra
  class Engine < Rails::Engine
    require 'acts-as-taggable-on'

    isolate_namespace Rostra
  end
end
