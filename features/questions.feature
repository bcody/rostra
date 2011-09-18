Feature: User asks questions
  As a user
  I want to ask questions
  So that I other users can provide helpful answers

  Scenario: User asks a new question
    Given I am on the questions page
    And I follow "Ask a question"
    Then I should be on the new question page
    When I fill in "Title" with "How many inches in a foot?"
    And I press "Post your question"
    Then I should be on the questions page
    And I should see "Your question has been posted"
    And "How many inches in a foot?" should be the first question listed
