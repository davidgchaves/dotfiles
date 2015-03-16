require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.rdoc LICENSE oh-my-zsh]
  files << "oh-my-zsh/custom/rbates.zsh-theme"
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/.#{file}"
    system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  using_zsh? ? puts("using zsh") : begin_switch_to_zsh_process
end

def using_zsh?
  ENV["SHELL"] =~ /zsh/
end

def begin_switch_to_zsh_process
  print "switch to zsh? (recommended) [ynq] "
  case $stdin.gets.chomp
  when 'y'
    puts "switching to zsh"
    system %Q{chsh -s `which zsh`}
  when 'q'
    exit
  else
    puts "skipping zsh"
  end
end

def install_oh_my_zsh
  oh_my_zsh_installed? ? puts("found oh-my-zsh") : begin_oh_my_zsh_installation_process
end

def oh_my_zsh_installed?
  File.exist?(File.join(ENV['HOME'], "oh-my-zsh")) || File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
end

def begin_oh_my_zsh_installation_process
  print "install oh-my-zsh? [ynq] "

  case $stdin.gets.chomp
  when 'y'
    puts "installing oh-my-zsh in $HOME/oh-my-zsh"
    system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/oh-my-zsh"}
  when 'q'
    exit
  else
    puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
  end
end

