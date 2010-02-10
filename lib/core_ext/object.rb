class Object

  ##
  #   @person ? @person.name : nil
  # or
  #  @people[:email] if @
  # vs
  #   @person.try(:name)
  def try(method, *args)
    result = send(method, *args) if respond_to?(method)
    result = send(:[], method) if result.nil? && respond_to?(:[])
    result
  end

  ##
  # Is this instance in the given collection?
  # Example:
  #   @person.in? members
  def in?(collection)
    collection.is_a?(Enumerable) &&
    collection.include?(self)
  end
  alias_method :present?, :in?

end
