
class HashWithIndifferentAccess

  ##
  # HashWithIndifferentAccess#dup always returns HashWithIndifferentAccess!
  # So if you subclass, you can't use dup!
  def dup
    self.class.new(self)
  end

  ##
  # Why the &*#^@*^&$ isn't HashWithIndifferentAccess doing this?
  # HashWithIndifferentAccess doesn't override Hash's []! That's
  # why it's so destructive!
  def [](key)
    key = key.to_s if key.kind_of?(Symbol)
    super(key)
  end

  ##
  # If you on 1.x, HashWithIndifferentAccess#update is broken! Hash#update
  # returns self, BUT HashWithIndifferentAccess#update does not!
  #
  #   { :a => 1 }.update({ :b => 2, :c => 3 })
  #   => { :a => 1, :b => 2, :c => 3 }
  #
  #   HashWithIndifferentAccess.new({ :a => 1 }).update({ :b => 2, :c => 3 })
  #   => { :b => 2, :c => 3 } # WTF?
  #
  # Subclasses should *never* override methods and break their protocols!!!!
  def update(hash)
    super(hash)
    self
  end

  ##
  # Return instances of this class for Hash values.
  def convert_value(value)
    value.class == Hash ? self.class.new(value) : value
  end

end
