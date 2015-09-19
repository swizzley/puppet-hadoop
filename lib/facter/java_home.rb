# Fact: java_home
#
# Purpose: get full java home string
#
# Resolution:
#   Tests for presence of java, returns nil if not present
#   returns output of "'readlink -f $(which java)|rev|cut -c 10-|rev'"
#
# Caveats:
#   none
#
# Notes:
#   None
Facter.add(:java_home) do
  setcode do
    if Facter::Util::Resolution.which('java')
      Facter::Util::Resolution.exec('readlink -f $(which java)|rev|cut -c 10-|rev')
    end
  end
end