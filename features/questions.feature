Feature: User asks questions
  As a user
  I want to ask questions
  So that I other users can provide helpful answers

  Scenario: User asks a new question
    Given I am new user named "Tom Jones" and have logged in
    And I am on the questions page
    And I follow "Ask a question"
    Then I should be on the new question page
    When I fill in "Title" with "How many inches in a foot?"
    When I fill in "Tags" with "measurement, construction"
    And I press "Post your question"
    Then I should be on the questions page
    And I should see "Your question has been posted"
    And "How many inches in a foot?" should be the first question listed

  Scenario: User edits their question
    Given I am new user named "Tom Jones" and have logged in
    And I have asked the question: "Why is the sky blue?"
    And I am on the questions page
    Then I should see "Why is the sky blue?"
    And I should see "Asked by Tom Jones"
    When I follow "edit"
    Then I should be on the edit page for "Why is the sky blue?"
    When I fill in "Details" with "Intelligent design, perhaps?"
    And I press "Post your question"
    Then I should be on the details page for "Why is the sky blue?"
    And I should see "Intelligent design, perhaps?" within the question details
