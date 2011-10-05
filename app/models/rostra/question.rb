
module Rostra
  class Question < ActiveRecord::Base

    belongs_to :user

    acts_as_taggable

    validates :title, :presence => true, :uniqueness => true, :length => { :minimum => 15 }
    validates :user, :presence => true
    validates :tag_list, :presence => true
    validates_size_of :tag_list, :maximum => 5, :message => 'maximum of 5 tags'
  end
end
