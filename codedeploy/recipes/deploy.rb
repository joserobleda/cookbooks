include_recipe 'awscli::default'

# copy file file from recipe to the system
cookbook_file "/tmp/trigger_deploy" do
  source "trigger_deploy"
  mode 0755
end

app = node[:codedeploy][:app_name]
group = node[:codedeploy][:app_group]
command = "bash /tmp/trigger_deploy #{app} #{group}"

execute "trigger deploy script" do
  command "#{command}"
  user "root"
end