require 'spec_helper'

describe 'yum_test::test_globalconfig_two' do
  let(:test_globalconfig_two_run) do
    ChefSpec::SoloRunner.new(
      step_into: 'yum_globalconfig'
    ).converge(described_recipe)
  end

  let(:test_globalconfig_two_content) do
    '# This file was generated by Chef
# Do NOT modify this file by hand.

[main]
alwaysprompt=true
assumeyes=true
bandwidth=40
bugtracker_url=http://somewhere.eltz.biz
cachedir=/path/to/somewhere/good
clean_requirements_on_remove=true
color=always
color_list_available_downgrade=fg:green
color_list_available_install=fg:green
color_list_available_reinstall=fg:green
color_list_available_upgrade=fg:green
color_list_installed_extra=fg:green
color_list_installed_newer=fg:green
color_list_installed_older=fg:green
color_list_installed_reinstall=fg:green
color_search_match=bold
color_update_installed=fg:blue
color_update_local=fg:blue
color_update_remote=fg:blue
commands=--installroot=root=/over/there
debuglevel=5
diskspacecheck=true
distroverpkg=fedora-release
enable_group_conditionals=1
errorlevel=5
exactarch=1
exclude=kernel emacs-nox
gpgcheck=1
group_package_types=default mandatory
history_list_view=commands
history_record=true
history_record_packages=rpm
http_caching=all
installonly_limit=3
installonlypkgs=kernel, emacs-nox
installroot=/over/there
keepalive=true
keepcache=1
kernelpkgnames=dowhatnow
localpkg_gpgcheck=true
logfile=/your/logs/here
max_retries=10
mdpolicy=instant
metadata_expire=21600
mirrorlist_expire=21600
multilib_policy=best
obsoletes=0
overwrite_groups=true
password=ohai
persistdir=/somewhere/good
pluginconfpath=/etc/yum/pluginconf.d
pluginpath=/path/to /some/plugins
plugins=1
protected_multilib=true
protected_packages=yum glob:/etc/yum/protected.d/*.conf
proxy=https://datproxy.biz
proxy_password=evewashere
proxy_username=alice
recent=7
repo_gpgcheck=true
reset_nice=true
rpmverbosity=warn
showdupesfromrepos=true
ssl_check_cert_permissions=true
sslcacert=/path/to/cacert
sslclientcert=/path/to/clientcert
sslclientkey=/path/to/clientkey
sslverify=true
syslog_device=/dev/log
syslog_facility=LOG_USER
syslog_ident=chuck norris
throttle=100000M
timeout=30
tsflags=noscripts
username=baub'
  end

  context 'creating a yum_globalconfig with full parameters' do
    it 'creates yum_globalconfig[/tmp/yum-full.conf]' do
      expect(test_globalconfig_two_run).to create_yum_globalconfig('/tmp/yum-full.conf')
    end

    it 'steps into yum_globalconfig and create template[/tmp/yum-full.conf]' do
      expect(test_globalconfig_two_run).to create_template('/tmp/yum-full.conf')
    end

    it 'steps into yum_globalconfig and render file[/tmp/yum-full.conf]' do
      expect(test_globalconfig_two_run).to render_file('/tmp/yum-full.conf').with_content(test_globalconfig_two_content)
    end
  end
end
