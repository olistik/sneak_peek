require "sneak_peek/version"

require "tempfile"
require "fileutils"

module SneakPeek

  module Utils
    def self.blank?(string)
      string == "" || string == nil
    end
  end

  def self.show_readme(gem_name:)
    tmp_dir = Dir.mktmpdir
    begin
      FileUtils.chdir tmp_dir
      `gem fetch #{gem_name}`
      gem_file = Dir["*.gem"].first
      if !gem_file
        puts "Can't find a gem with the name `#{gem_name}`"
        exit 1
      end
      `gem unpack #{gem_file}`
      gem_directory = Dir["*"].find do |file|
        File.directory?(file)
      end
      gem_files = Dir["#{gem_directory}/*"]
      readme_file = gem_files.find do |file|
        file.downcase.match /readme/
      end
      if !readme_file
        puts "Can't find a readme."
        puts "This is the content of the gem:\n\t\n- #{gem_files.join("\n\t- ")}"
        exit 1
      end
      puts File.read(readme_file)
    ensure
      FileUtils.remove_entry tmp_dir
    end
  end

end
