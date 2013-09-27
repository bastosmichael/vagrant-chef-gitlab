# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  #config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = "YOUR KEY"
    aws.secret_access_key = "YOUR SECRET KEY"
    aws.keypair_name = "KEYPAIR NAME"
    override.ssh.private_key_path = "PATH TO YOUR PRIVATE KEY"
    override.ssh.username = "ubuntu"
    aws.ami = "ami-a1fd74c8"
    aws.instance_type = "m1.small"
  end

  config.vm.provider :rackspace do |rs|
    rs.username = "YOUR USERNAME"
    rs.api_key  = "YOUR API KEY"
    rs.flavor   = /512MB/
    rs.image    = /Ubuntu/
  end

  # Port 8000 on the host will go to port 80 on the Vagrant box
  config.vm.network :forwarded_port, guest: 80, host: 8000, auto_correct: true

  # Here's a folder for passing stuff back and forth
  config.vm.synced_folder "./shared", "/home/vagrant/host_shared"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbook"]
    chef.add_recipe "gitlab"
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      },
#      :gitlab => {
#        :omniauth => {
#          enabled: true,
#          allow_single_sign_on: true,
#          block_auto_created_users: false,
#          providers: [ 'saml' ],
#          saml: {
#            callback:               'http://33.33.33.10/users/auth/saml/callback',
#            issuer:                 'unlp.cespi.gitlab',
#            idp_sso_target_url:     'https://sso.unlp.edu.ar/saml2/idp/SSOService.php',
#            idp_cert_fingerprint:   'XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX',
#            name_identifier_format: 'urn:oasis:names:tc:SAML:2.0:nameid-format:persistent'
#          }
#        }
#      }
      }
  end
end