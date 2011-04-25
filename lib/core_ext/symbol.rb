class Symbol

  ##
  # Ever call a string method on a symbol,
  # forgetting to convert it to a string
  # first?  Yeah, me too...
  def method_missing(method, *args, &block)
    s = to_s
    if s.respond_to?(method)
      s.send(method, *args)
    else
      super(method, *args, &block)
    end
  end

  #include Comparable - Do I need this?
  # treat symbols as strings for comparison purposes
  def <=>(other)
    self.to_s <=> other.to_s
  end
  
end
