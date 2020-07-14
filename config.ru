# frozen_string_literal: true

require_relative 'users_application'
require_relative 'stories_application'
require_relative 'database'

map('/users') do
  run UsersApplication.new
end

map('/stories') do
  run StoriesApplication.new
end
