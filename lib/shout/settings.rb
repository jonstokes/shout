module Shout
  module Settings

    class SettingsData < Struct.new(:logger)
    end

    def self.configuration
      @configuration ||= Shout::Settings::SettingsData.new
    end

    def self.configure
      yield configuration
    end

    def self.logger
      return unless configured?
      configuration.logger
    end

    def self.configured?
      !!configuration
    end
  end
end
