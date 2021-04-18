module TimeHelper

  def self.format_date(date)
    date.strftime("%d/%m/%Y")
  end

  def self.format_time(time)
    time.strftime("%H:%M")
  end

  def self.calculate_entry_amount(entry)
    date = entry.date
    work_time = entry.start_time.strftime("%H").to_i..entry.finish_time.strftime("%H").to_i
    hours = (entry.finish_time.to_i - entry.start_time.to_i) / 60
    total_hours = (((hours / 60.0 * 4).round / 4.0 * 60).to_i / 60.00)
    pay =
      if date.monday? || date.wednesday? || date.friday?
        in_range_hours = work_time.intersection(07..19)
        in_range_hours_amount = in_range_hours * 22
        ((total_hours - in_range_hours) * 33) + in_range_hours_amount
      elsif date.tuesday? || date.thursday?
        in_range_hours = work_time.intersection(05..17)
        in_range_hours_amount = in_range_hours * 25
        ((total_hours - in_range_hours) * 35) + in_range_hours_amount
      else
        total_hours * 47
      end
    return pay
  end
end

class Range
  def intersection(other)
    return 0 if (self.max < other.begin or other.max < self.begin)
    max = [self.begin, other.begin].max
    min = [self.max, other.max].min
    [self.begin, other.begin].max..[self.max, other.max].min
    min - max
  end
  alias_method :&, :intersection
end
