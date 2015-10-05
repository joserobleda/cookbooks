execute "apt-get update" do
  action :nothing
  command "apt-get update"
end

apt_repository "ondrej-php-#{node["lsb"]["codename"]}" do
  uri "http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu"
  distribution node["lsb"]["codename"]
  components ["main"]
  keyserver 'keyserver.ubuntu.com'
  key 'E5267A6C'
  action :add
  notifies :run, "execute[apt-get update]", :immediately
end