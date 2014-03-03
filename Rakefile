require 'rake'

desc "install the dot files!"
task :install do
  Dir['*'].each do |file|
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
