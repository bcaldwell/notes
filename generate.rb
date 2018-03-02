require "yaml"
require 'fileutils'

file_root = "./_notes"

template =  <<~HEREDOC
---
layout: note
---
HEREDOC

data = YAML.load_file("./_data/notes.yml")

data.each do |term|

  term["notes"].each do |course|
    file = File.join(file_root, course["path"]+".md")

    unless File.exist? file
      puts file
      dirname = File.dirname(file)
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end

      File.write(file, template)
    end
  end
end
