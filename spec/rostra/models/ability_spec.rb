require 'spec_helper'

module Rostra
  describe Ability do

    describe "logged in user" do

      context "asking/editing questions" do
        before :all do
          user = Factory(:user)
          @their_question = Factory(:question, :user => user)
          @someone_elses_question = Factory(:question)
          @user = Ability.new(user)
        end
        specify { @user.should be_able_to(:manage, @their_question) }
        specify { @user.should_not be_able_to(:manage, @someone_elses_question) }
      end

    end

    describe "guest permissions" do
      before :all do
        @guest_user = Ability.new(User.new)
      end

      context "allowed activities" do
        specify { @guest_user.should be_able_to(:read, Question) }
      end

      context "disallowed activities" do
        specify { @guest_user.should_not be_able_to(:manage, Question) }
      end
    end

  end
end