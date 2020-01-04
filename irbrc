# frozen_string_literal: true

# Allows you to have a local .irbrc in your project's working dir
class Irbrc
  BLACKLIST = [ENV['HOME'], '/'].freeze

  def self.load(path = Dir.pwd)
    return if BLACKLIST.include?(path)

    irbrc = File.join(path, '.irbrc')
    return unless File.exist?(irbrc)

    puts "--> loading #{irbrc}"
    load irbrc
  end
end

Irbrc.load
