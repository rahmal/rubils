class Object

  ##
  #   @person ? @person.name : nil
  #            - or -
  #  @people[:email] if @people
  #            - vs -
  #   @person.try(:name)
  def try(method, *args)
    result = send(method, *args) if respond_to?(method)
    result = send(:[], method) if result.nil? && respond_to?(:[])
    result
  end

  ##
  # Is this instance in the given collection?
  #
  # Example:
  #   @person.in? members
  #   name.in 'John', 'Harry', 'Tim'
  #   'es'.in? 'test'
  def in *args
    if args.size == 1 && (args.first.is_a?(Enumerable) || args.first.is_a?(String))
      args = args.first
    end
    case args
      when Enumerable
        args.include? self
      when String
       !!args[self]       
    end
    false  
  end
  alias :in?, :in


  def safely *envs, &block
    return unless block_given?
    yield if envs.empty? || envs.map(&:to_sym).any? {|e| e == RAILS_ENV.to_sym}
  rescue Exception => e
    # ignore error
  end

  def bool?
    false
  end

end
