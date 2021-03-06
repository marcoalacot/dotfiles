require 'rake'
# based on https://github.com/r00k/dotfiles

desc "install the dot files!"
task :install do
  @replace_all = false

  Dir['*'].each do |file|
    next if skipped_files.include?(file)

    if file_exists?(file)
      @replace_all ? replace_file(file) : handle_overwrite(file)
    else
      link_file(file)
    end
  end

  install_colour
  install_oh_my_zsh
  install_fzf
  install_ag
  create_notes_directory
end

def handle_overwrite(file)
  print "overwrite ~/.#{file}? [ynaq] "

  case $stdin.gets.chomp
  when 'a'
    set_replace_all
    replace_file(file)
  when 'y'
    replace_file(file)
  when 'q'
    exit
  else
    puts "skipping ~/.#{file}"
  end
end

def install_colour
  puts "Installing colour..."
  system %Q{mkdir "$HOME/.vim/colors"}
  system %Q{cp "$PWD/colors/molokai.vim" "$HOME/.vim/colors/molokai.vim"}
end

def set_replace_all
  @replace_all = true
end

def skipped_files
  skipped_files = %w[README.md Rakefile]
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def file_exists?(file)
  File.exist?(File.join(ENV['HOME'], ".#{file}"))
end

def install_ag
  system %Q{sudo apt-get install silversearcher-ag}
end

def install_fzf
  system %Q{git clone https://github.com/junegunn/fzf.git ~/.fzf}
  system %Q{~/.fzf/install}
end

def install_oh_my_zsh
  system %Q{curl -L http://install.ohmyz.sh | sh}
end

def create_notes_directory
  system %Q{mkdir "$HOME/notes"}
end
