require "shout/version"

module Shout
  def self.included(klass)
    klass.extend(self)
  end

  def error(log_line)
    log(log_line, type: :error)
  end

  def log(log_line, opts={})
    domain_insert = @domain ? "[#{@domain}]": ""
    error_insert = (opts[:type] == :error) ? "PlatformError " : ""
    complete_log_line = "[#{self.class}](#{Thread.current.object_id})#{domain_insert}: #{error_insert}#{log_line}"
    Shout::Settings.logger.info complete_log_line
  end
end
