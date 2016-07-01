###
# Configurarion class file for VM provided by Keith Mifsud
#
# (c) Keith Mifsud <mifsud.k@gmail.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# Instructions, support and issues: https://github.com/keithmifsud/vagrant-jekyll
##

class Architect

    def Architect.configure(config, settings)

        # Attempt to avoid TTY errors.
        config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

        # Set the usbale ports / range of ports.
        config.vm.usable_port_range = (10200..10500)

        # Set the provider.
        config.vm.provider = settings["provider"]

        # Allow ssh agent to be forwarded from this box.
        config.ssh.forward_agent = true

        # Configure this box.
        config.vm.box = settings["box"]
        config.vm.hostname = settings["hostname"]

        # Set an internal network ip address.
        config.vm.network :private_network, ip: settings["ip"]

        # Set up virtual box provider.
        config.vm.provider "virtualbox" do |prov|
            prov.name = settings["name"]
            prov.customize ["modifyvm", :id, "--memory", settings["ram"]]
            prov.customize ["modifyvm", :id, "--cpus", settings["cpus"]]
            prov.customize ["modifyvm", :id, "--cpuexecutioncap", "30"]
            prov.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            prov.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            prov.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
        end


        # Bootstrap the box provisioning.


        ## Set some vars from config.


        bootstapScriptPath = "#{packageScriptsPath}/" + settings["script"]
        config.vm.provision :shell, :path => "#{bootstrapScriptPath}"

        # Shared folders.

        # Forward ports.
        config.vm.network "forwarded_port", guest: 4000, host: 4000

        # Set bash aliases


        # SSh keys.

        #

    end
end
