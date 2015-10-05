include_recipe 'apt-nginx'

package 'nginx'
service 'nginx'

cookbook_file "/etc/nginx/nginx.conf" do
  source 'nginx/nginx.conf'
  notifies :restart, "service[nginx]", :delayed
end

cookbook_file "/etc/nginx/conf.d/default.conf" do
  source 'nginx/default.conf'
  notifies :restart, "service[nginx]", :delayed
end

cookbook_file "/etc/ssl/certs/nginx.crt" do
  source 'nginx/nginx.crt'
  notifies :restart, "service[nginx]", :delayed
end

cookbook_file "/etc/ssl/private/nginx.key" do
  source 'nginx/nginx.key'
  notifies :restart, "service[nginx]", :delayed
end