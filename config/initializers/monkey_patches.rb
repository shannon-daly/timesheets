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