# frozen_string_literal: true

class UsersApplication
  def call(env)
    response = Rack::Response.new

    if env['PATH_INFO'] == ''
      response.write(Database.users.to_json)
      # The =~ operator matches the regular expression against a string or use .match()
    elsif env['PATH_INFO'] =~ /\d+/
      id = env['PATH_INFO'].split('/').last.to_i
      user = Database.users[id]
      if user.nil?
        response.status = 404
        response.write('User Not Found')
      else
        response.write(Database.users[id].to_json)
      end
    else
      response.status = 404
      response.write('Route Not Found')
    end

    response.headers['Content-Type'] = 'application/json'
    response.finish
  end
end
