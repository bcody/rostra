module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^the questions page$/
      '/rostra/questions'

    when /^the new question page$/
      '/rostra/questions/new'

    when /^the edit page for "([^"]*)"$/
      question = Rostra::Question.find_by_title($1)
      "/rostra/questions/#{question.id}/edit"

    when /^the details page for "([^"]*)"$/
      question = Rostra::Question.find_by_title($1)
      "/rostra/questions/#{question.id}"

    when /^the login page$/
      "/users/sign_in"

    when /^the edit answer page$/
      question = Rostra::Question.last
      answer = question.answers.first
      "/rostra/questions/#{question.id}/answers/#{answer.id}/edit"

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
