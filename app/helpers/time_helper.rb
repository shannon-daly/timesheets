module TimeHelper

  def self.format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def self.format_time(time)
    time.strftime("%I:%M")
  end
end
