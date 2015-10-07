include_recipe 'awscli::default'

# copy file file from recipe to the system
cookbook_file "/tmp/ec2tag" do
  source "ec2tag"
  mode 0755
end

execute "trigger deploy script" do
  command "bash /tmp/ec2tag codedeploy pending"
  user "root"
end