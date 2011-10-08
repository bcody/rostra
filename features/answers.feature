Feature: User answers a question
  As a user
  I want to answer questions
  So that I can help other and increase my reputation

  Background: Someone has asked a question
    Given someone has asked the question: "Why is the sky blue?"

  Scenario: User answers another users question question
    Given I am new user named "John Swift" and have logged in
    And I am on the details page for "Why is the sky blue?"
    When I fill in "Answer this question" with "The atmosphere, duh"
    And I press "Answer"
    Then I am on the details page for "Why is the sky blue?"
    And I should see "1 Answer" within the answers count
    And I should see "John Swift says:" within the answers section
    And I should see "The atmosphere, duh" within the answers section

  Scenario: Cannot answer questions unless logged in
    Given I am not logged in
    And I am on the details page for "Why is the sky blue?"
    Then I should not see the answer form
    And I should see "Login to answer this question"
    When I follow "Login to answer this question"
    Then I should be on the login page
