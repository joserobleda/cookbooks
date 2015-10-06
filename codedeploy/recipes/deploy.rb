include_recipe 'awscli::default'
# execute "trigger" do
#   user "root"
#   command "#{Chef::Config[:file_cache_path]}/default/trigger"
# end

# bash 'trigger' do
#   code <<-EOH
#   	aws deploy list-deployments \
#   	--application-name SamplePhpApp \
#   	--deployment-group-name SamplePhpAppGroup \
#   	--include-only-statuses Succeeded \
#   	--region=eu-west-1 \
#   	> #{Chef::Config[:file_cache_path]}/deployments.json
#     EOH
# end


# list = "aws deploy list-deployments --application-name SamplePhpApp --deployment-group-name SamplePhpAppGroup --include-only-statuses Succeeded --region=eu-west-1"
# command = Mixlib::ShellOut.new(list)
# output = cc.run_command.stdout


# ruby_block "Read" do
# 	block do
# 		deployments = JSON.parse(File.read("#{Chef::Config[:file_cache_path]}/deployments.json"))
# 	end
# end

# bash 'trigger' do
#   code <<-EOH
#   	touch ~/#{deployments.deployments[0]}.log
#     EOH
# end

cookbook_file "/tmp/trigger_deploy" do
  source "trigger_deploy"
  mode 0755
end

execute "execute trigger deploy script" do
  command "bash /tmp/trigger_deploy"
  user "root"
end