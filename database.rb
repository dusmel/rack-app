# frozen_string_literal: true

class Database
  USERS = {
    1 => {
      name: 'Hadad',
      age: 23
    },
    2 => {
      name: 'Elvis',
      age: 18
    }
  }.freeze
  STORIES = {
    1 => {
      title: 'Kidnaping',
      comment: "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change"
    },
    2 => {
      name: 'Comining soon...',
      age: "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change"
    }
  }.freeze

  def self.users
    USERS
  end

  def self.stories
    STORIES
  end
end
