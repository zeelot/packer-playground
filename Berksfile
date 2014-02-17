# vi:ft=ruby:
site :opscode

cookbook 'apache2'
cookbook 'apt'
cookbook 'mysql'
cookbook 'nginx'
cookbook 'php'
cookbook 'php-fpm'
cookbook 'rabbitmq'

# This portion allows the site-cookbooks/* directory to be used.
def dependencies(path)
  berks = "#{path}/Berksfile.in"
  instance_eval(File.read(berks)) if File.exists?(berks)
end

Dir.glob('./site-cookbooks/*').each do |path|
  dependencies path
  cookbook File.basename(path), :path => path
end