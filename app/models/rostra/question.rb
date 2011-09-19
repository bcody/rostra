module Rostra
  class Question < ActiveRecord::Base

    validates_presence_of :title
  end
end
