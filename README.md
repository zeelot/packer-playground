packer-playground
=================

Just playing around with Packer, AWS, Vagrant, and LXC.

Cool Commands n Stuff
=====================

 - `berks install --path cookbooks`

Pulls in all our cookbook dependencies and shoves them in the `cookbooks` directory (relative). This also takes care of pulling the `site-cookbooks` in which is why **Vagrant** and **Packer** only need to know about the one `cookbooks` directory. Take a look at the `Berksfile` to see how this works.

 - `knife solo data bag create nginx_sites some_site_worpd_com`

Creates a data bag called `nginx_sites` and adds an entry called `some_site_worpd_com`. I use the data bags to define the nginx sites to install on the server. The data bags are encrypted with the `.chef/encrypted_data_bag_secret` file which does not get committed to the repo. If you want to actually run this repo's code, you will need to get my secret or make your own and edit the data bags. Data bags are being committed as a reference.

 - `packer build -var-file variables.json example.json`

Run the packer tool with the configuration defined in `example.json`. Sensitive information comes from `variables.json` which is not committed to the repo. Currently, the only variables you need to define are the **AWS** credentials.

 - `vagrant up --provision`

Start a **Vagrant** VM and force it to provision. I run this command to test my roles and cookbooks before running the **Packer** command simply because it's faster.

Things
======

 - `gem install knife-solo_data_bag` (https://github.com/thbishop/knife-solo_data_bag)

Installs a knife plugin specifically for creating data bags without a chef server.