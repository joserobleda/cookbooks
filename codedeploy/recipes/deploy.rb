include_recipe 'awscli::default'

# copy file file from recipe to the system
cookbook_file "/tmp/trigger_deploy" do
  source "trigger_deploy"
  mode 0755
end

app = node[:codedeploy][:app_name]
group_src = node[:codedeploy][:app_group_src]
group_target = node[:codedeploy][:app_group_target]
command = "bash /tmp/trigger_deploy #{app} #{group_src} #{group_target}"

execute "trigger deploy script" do
  command "#{command}"
  user "root"
end