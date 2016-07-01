###
# Vagrant file for VM provided by Keith Mifsud
#
# (c) Keith Mifsud <mifsud.k@gmail.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# Instructions, support and issues: https://github.com/keithmifsud/vagrant-jekyll
##

require 'yaml'

# A bit of segregation so that we can swap or extend this if desired.
parentPackage = "Architect"


# Get the package / source directory path
packageDir = File.expand_path("#{parentPackage}", File.dirname(__FILE__))

# Set the package paths
configFilePath = "#{packageDir}/" + "configuration"
packageScriptsPath = "#{packageDir}/" + "scripts"

# Get the contents of the configuration file.
configFile = "#{configFilePath}/" + "#{parentPackage}.yaml"
settings = YAML::load(File.read("#{configFile}"))

# Check for updates if so set
if ( settings["auto_update"] )

    updateClassFile = "#{packageDir}/" + settings["update_class_file"]
    require File.expand_path("#{updateClassFile}")

    updateClass = Object.const_get(settings["update_class"])

    currentVersion = settings["version"]
    checkUpdateFrom = settings["check_update_location"]

    updateclass.perform_if_available(currentVersion, checkUpdateFrom)
end

# Set the api version from settings
vagrantApiVersion = settings["vagrant_api_version"] ||= "2"
VAGRANTFILE_API_VERSION = VAGRANTFILE_API_VERSION ||= vagrantApiVersion

# Get the installation path
installPath = "#{File.dirname(__FILE__)}/" + settings["install_path"]

# Get and Require the config class file
configClassFile = "#{installPath}/" + settings["config_class_file"]
require File.expand_path("#{configClassFile}")

# Configure vagrant using the config class
configClass = Object.const_get(settings["config_class"])

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    configClass.configure(config, settings)
end
