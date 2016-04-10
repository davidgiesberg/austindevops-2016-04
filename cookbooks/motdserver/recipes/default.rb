#
# Cookbook Name:: motdserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'example'

include_recipe 'nginx::default'

package 'curl'

directory '/var/www/motd' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

link '/var/www/motd/index.html' do
  to '/etc/motd'
end

cookbook_file '/etc/nginx/sites-available/motd' do
  source 'motd.nginx.conf'
  owner 'root'
  group 'root'
  mode '0644'
end

nginx_site 'motd' do
  enable true
end