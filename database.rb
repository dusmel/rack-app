# frozen_string_literal: true

class Database
  @@users = {
    1 => {
      name: 'Hadad',
      age: 23
    },
    2 => {
      name: 'Elvis',
      age: 18
    }
  }.freeze
  @@stories = {
    1 => {
      title: 'Kidnaping',
      comment: "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change"
    },
    2 => {
      title: 'Comining soon...',
      comment: "So perhaps, you've generated some fancy text, and you're content that you can now copy and paste your fancy text in the comments section of funny cat videos, but perhaps you're wondering how it's even possible to change"
    }
  }

  def self.users
    @@users
  end

  def self.stories
    @@stories
  end

  def self.add_story(story)
    new_id = @@stories.keys.max + 1
    @@stories[new_id] = story
  end
end
