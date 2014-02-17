# Where the ssl certs will be stored if needed.
directory "#{node[:nginx_sites][:ssl_dir]}" do
  mode 00755
  action :create
end

# Disable the default site, if configured to do so.
nginx_site "default" do
    enable node[:nginx_sites][:disable_default_site]
end

apps = data_bag('nginx_sites')
apps.each do |name|
  app = Chef::EncryptedDataBagItem.load('nginx_sites', name)

  template "/etc/nginx/sites-available/#{app[:server_name]}" do
    source "nginx_app.erb"
    variables({
      :server_name => app['server_name'],
      :docroot => app['docroot']
    })
  end

  nginx_site app[:server_name]
end