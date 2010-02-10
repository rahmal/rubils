module Enumerable

  def sum
    inject(0) { |sum, n| sum += n }
  end

end
