require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Then /^"([^"]*)" should be the first question listed$/ do |question_title|
  within('#questions .question:first-child') do
    page.should have_content(question_title)
  end
end
