require 'rake'

desc "install the dotfiles into user's home directory"
task :install do
  link_dotfiles dotfiles_in_repository
end

desc "uninstall the dotfiles in user's home directory"
task :uninstall do
  unlink_dotfiles dotfiles_in_repository
end

def dotfiles_in_repository
  all_files_and_dirs_in_repository = Dir['*']
  not_dotfiles = %w[Rakefile README.md LICENSE iterm2-colors-solarized]

  all_files_and_dirs_in_repository - not_dotfiles
end

def link_dotfiles(dotfiles)
  dotfiles.each do |dotfile_to_link|
    if already_exist? dotfile_to_link
      if is_identical? dotfile_to_link
        skip_identical_file dotfile_to_link
      else
        to_override_or_not_to_override! dotfile_to_link
      end
    else
      link_file_or_directory! dotfile_to_link
    end
  end
end

def unlink_dotfiles(dotfiles)
  dotfiles.each do |dotfile_to_unlink|
    puts "unlinking ~/.#{dotfile_to_unlink}"
    system %Q{unlink "$HOME/.#{dotfile_to_unlink}"}
  end
end

def already_exist?(dotfile)
  dotfile_on_disk = File.join(ENV['HOME'], ".#{dotfile}")
  File.exist? dotfile_on_disk
end

def is_identical?(dotfile)
  dotfile_on_disk = File.join(ENV['HOME'], ".#{dotfile}")
  File.identical? dotfile, dotfile_on_disk
end

def to_override_or_not_to_override!(dotfile)
  print "Do you want to overwrite existing ~/.#{dotfile}? [(y)es, (n)o, (q)uit] "

  option = $stdin.gets.chomp

  case option
  when 'y'
    replace_file!(dotfile)
  when 'n'
    skip_file(dotfile)
  when 'q'
    abort_execution
  else
    skip_file(dotfile)
  end
end

def replace_file!(dotfile)
  delete_file!(dotfile)
  link_file_or_directory!(dotfile)
end

def delete_file!(dotfile)
  system %Q{rm -rf "$HOME/.#{dotfile}"}
end

def link_file_or_directory!(dotfile)
  puts "linking ~/.#{dotfile}"
  system %Q{ln -s "$PWD/#{dotfile}" "$HOME/.#{dotfile}"}
end

def skip_file(dotfile)
  puts "skipping ~/.#{dotfile}"
end

def skip_identical_file(dotfile)
  puts "skipping identical ~/.#{dotfile}"
end

def abort_execution
  puts "aborting..."
  exit
end
