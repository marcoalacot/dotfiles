require 'rake'
# based on https://github.com/r00k/dotfiles

desc "install the dot files!"
task :install do
  skipped_files = %w[README.md Rakefile]

  Dir['*'].each do |file|
    next if skipped_files.include?(file)

    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
