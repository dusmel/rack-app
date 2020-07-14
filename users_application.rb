# frozen_string_literal: true

class UsersApplication
  def call(env)
    if env['PATH_INFO'] == ''
      [200, {}, [Database.users.to_s]]
      # The =~ operator matches the regular expression against a string or use .match()
    elsif env['PATH_INFO'] =~ /\d+/
      id = env['PATH_INFO'].split('/').last.to_i
      [200, {}, [Database.users[id].to_s]]
    else
      [404, {}, ['Route Not Found']]
    end
  end
end
