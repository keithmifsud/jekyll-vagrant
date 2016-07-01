###
# Update class file for VM provided by Keith Mifsud
#
# (c) Keith Mifsud <mifsud.k@gmail.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# Instructions, support and issues: https://github.com/keithmifsud/vagrant-jekyll
##

require 'yaml'

class Update

    def Update.perform_if_available(version, location)

        if(self.update_available(version, self.get_latest_version_number(location)))
            return self.perform_update()
        end
    end

    def self.get_latest_version_number(location)
        latestVersion = "0.1"
        return latestVersion
    end

    def self.update_available(currentVersion, latestVersion)
        return Gem::Version.new(currentVersion) > Gem::Version.new(latestVersion)
    end

    def self.perform_update()
        return "updating"
    end

end