module Rostra
  class Answer < ActiveRecord::Base
    belongs_to :question
    belongs_to :user

    validates :text, :presence => true
  end
end
