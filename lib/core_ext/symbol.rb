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

end
