# Para que no de error TZInfo::InvalidTimeZoneIdentifier
require 'tzinfo'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
UYPort::Application.initialize!

ActiveSupport::Deprecation.silenced = true 