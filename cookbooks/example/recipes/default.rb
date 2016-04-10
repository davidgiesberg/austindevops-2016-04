# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

log "Welcome to Chef, #{node["example"]["name"]}!" do
  level :info
end

# For more information, see the documentation: https://docs.getchef.com/essentials_cookbook_recipes.html

cookbook_file '/etc/motd' do
  source 'motd'
  owner 'root'
  group 'root'
  mode '0644'
end
