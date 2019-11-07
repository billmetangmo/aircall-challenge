# Aircall.io - DevOps technical test

Automate the installation of "devops-test-ruby" which source code is available at: https://github.com/aircall/devops-test-ruby on Ubuntu xenial.

## Getting Started


### Prerequisites

We need to consider 2 cases:

1. You have a fresh Ubuntu 16.04 LTS server at your disposal. Connect on it and execute the following commands:
  
```
# Clone this git repository
git clone https://github.com/billmetangmo/aircall-challenge.git

# Start the application
chmod u+x vagrant/bootstrap.sh
./vagrant/bootstrap.sh
```

2. You need to create a fresh Ubuntu 16.04 LTS server. We have prepared an environment that you can easily setup locally using vagrant. To do so, install the following software:
* Virtualbox ( tested version 5.2.18)
* Vagrant ( tested version 2.1.5)

Then:
```
# Clone this git repository
git clone https://github.com/billmetangmo/aircall-challenge.git

# Create the virtual machine with ansible
vagrant up ( this will hang as at the end it starts the application)
vagrant ssh
```

### Usage

Open web browser at http://<vm-ip-address>:9292 ( if you used vagrant the IP address is 192.168.33.50).


