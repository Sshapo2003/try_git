module Timeout
  def self.timeout_and_raise(timeout_value, error_text, &block)
    begin
      self.timeout(timeout_value, &block)
    rescue Timeout::Error
      raise error_text
    end
  end
end