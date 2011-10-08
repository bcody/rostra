require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

# --------------------------------------------------------------------------------------------------------------
#                                                   DEVISE STEPS
# --------------------------------------------------------------------------------------------------------------
Given /^I am new user named "([^"]*)" and have logged in$/ do |user_name|
  user = Factory(:user, :email => 'user@example.com', :password => 'password', :name => user_name)
  And %{I login as "#{user.email}" with password "#{user.password}"}
end

When /^I (?:login|log in) as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  visit new_user_session_path
  fill_in('user_email', :with => email)
  fill_in('user_password', :with => password)
  click_button('Sign in')
end

Given /^I am not logged in$/ do
  # TODO: Clear sesssion. Necessary?
end


# --------------------------------------------------------------------------------------------------------------
#                                             QUESTION STEPS
# --------------------------------------------------------------------------------------------------------------

Then /^"([^"]*)" should be the first question listed$/ do |question_title|
  within('#questions .question:first-child') do
    page.should have_content(question_title)
  end
end

Given /^(?:I have|someone has) asked the question: "([^"]*)"$/ do |question_title|
  Factory(:question, :title => question_title, :user => User.last || Factory(:user))
end

Then /^I should not see the answer form$/ do
  page.should_not have_css('#new_rostra_answer')
end
