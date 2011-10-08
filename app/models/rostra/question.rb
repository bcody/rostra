module Rostra
  class Question < ActiveRecord::Base

    belongs_to :user
    has_many :answers

    acts_as_taggable

    validates :title, :presence => true, :uniqueness => true, :length => { :minimum => 15 }
    validates :user, :presence => true
    validates :tag_list, :presence => true
  end
end
