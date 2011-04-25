class Boolean

  attr_reader :value

  def initialize arg
    case arg
      when TrueClass, FalseClass
        @value = arg
      when Fixnum
        @value = (arg > 0)
      when String
        @value = (arg == 'true')
      when NilClass
        @value = false
      else
        raise ArgumentError, "Can't convert #{arg}:#{arg.class} to boolean"
    end
  end

  def bool?
    true
  end

  def to_b
    @value
  end

  def to_i
    @value ? 1 : 0
  end

  def to_s
    @value.to_s
  end

  def ==(arg)
    @value == arg
  end

  def ===(arg)
    @value === arg
  end

  class << self
    def ===(arg)
      arg.is_a?(self) ||
      arg.is_a?(TrueClass) ||
      arg.is_a?(FalseClass)
    end
  end

end

class TrueClass
  def to_i; 1 end
  def to_b; true end
  def bool?; true end
end

class FalseClass
  def to_i; 0 end
  def to_b; false end
  def bool?; true end
end
