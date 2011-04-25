class Time
  SECONDS_PER_DAY = 60 * 60 * 24

  DATE_FORMATS ||= Hash.new
  DATE_FORMATS[:ymd] = '%Y-%m-%d'

  def before? t
    self < t
  end

  def after? t
    self > t
  end
end
