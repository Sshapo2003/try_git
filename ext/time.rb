class Time
  def self.unix_gmt
    now.strftime "%Y-%m-%dT%H:%M:%S+00:00Z"
  end

  def self.hours_mins_seconds
    now.strftime "%H:%M:%S"
  end
end
