#!/home/prajjwal/.rbenv/shims/ruby

# frozen_string_literal: true

# Quick and dirty script to copy mpd playlists to a folder (typically on a
# phone).
#
# Usage:
# copy_mpd_playlist.rb <playlist_name> <destination>

require 'etc'
require 'logger'
require 'fileutils'

class MPD
  def initialize
    @logger = Logger.new(STDOUT)
    @user = Etc.getlogin
    @config = File.read("/home/#{@user}/.mpdconf")
    @music_dir = "/home/#{@user}/music"
    @playlist_dir = "/home/#{@user}/.mpd/playlists"
  end

  def copy_playlist(name, dest)
    playlist_path = File.join(@playlist_dir, "#{name}.m3u")

    error("#{dest} is not a directory!") unless File.directory?(dest)
    error("#{dest} is not writable!") unless File.writable?(dest)
    error("#{playlist_path} unreadable!") unless File.readable?(playlist_path)

    @logger.info("Copying playlist #{name} to #{dest}")

    File.readlines(playlist_path).each_slice(5) do |tracks|
      srcs = tracks.map { |t| File.join(@music_dir, t.chomp) }
      FileUtils.cp(srcs, dest, verbose: true)
    end
  end

  private

  def error(msg = 'something went wrong!')
    @logger.error(msg)
    exit 1
  end

  def track_path(name)
    File.join(@music_dir, name.chomp)
  end
end

MPD.new.copy_playlist(ARGV[0], ARGV[1])
