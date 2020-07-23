# frozen_string_literal: true

require 'json'
class StoriesApplication
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    if env['PATH_INFO'] == ''
      if request.post?
        post_a_story(request, response)
      else
        get_all_stories(response)
      end
      # The =~ operator matches the regular expression against a string or use .match()
    elsif env['PATH_INFO'] =~ /\d+/
      id = env['PATH_INFO'].split('/').last.to_i
      story = Database.stories[id]
      if story.nil?
        response.status = 404
        response.write('Story Not Found')
      else
        response.write(Database.story[id].to_json)
      end
    else
      response.status = 404
      response.write('Route Not Found')
    end
    response.headers['Content-Type'] = 'application/json'
    response.finish
  end

  def self.get_all_stories(response)
    response.write(Database.stories.to_json)
  end

  def self.post_a_story(request, response)
    story = JSON.parse(request.body.read)
    Database.add_story(story)
    response.write({ message: 'Story added success fully' }.to_json)
  end
end
