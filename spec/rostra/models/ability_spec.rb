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

      context "answering questions" do
        before :all do
          user = Factory(:user)
          @their_answer = Factory(:answer, :user => user)
          @someone_elses_answer = Factory(:answer)
          @user = Ability.new(user)
        end
        specify { @user.should be_able_to(:manage, @their_answer) }
        specify { @user.should_not be_able_to(:manage, @someone_elses_answer) }
      end

    end

    describe "guest permissions" do
      before :all do
        @guest_user = Ability.new(User.new)
      end

      context "allowed activities" do
        specify { @guest_user.should be_able_to(:read, Question) }
        specify { @guest_user.should be_able_to(:read, Answer) }
      end

      context "disallowed activities" do
        specify { @guest_user.should_not be_able_to(:manage, Question) }
        specify { @guest_user.should_not be_able_to(:manage, Answer) }
      end
    end

  end
end